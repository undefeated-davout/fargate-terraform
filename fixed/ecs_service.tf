resource "aws_ecs_service" "ecs-sb" {
  # サービスの設定
  name                               = "${local.app_name}-${local.env}-ecs-sb"
  launch_type                        = "FARGATE"
  task_definition                    = aws_ecs_task_definition.ecs-tk.arn
  platform_version                   = "LATEST"
  cluster                            = "${local.app_name}-${local.env}-ecs-cl"
  scheduling_strategy                = "REPLICA"
  desired_count                      = "2"
  deployment_minimum_healthy_percent = "100"
  deployment_maximum_percent         = "200"
  deployment_controller { // ローリングアップデート
    type = "ECS"
  }

  # ネットワーク構成
  network_configuration {
    subnets = [
      aws_subnet.sb-pr-container-a.id,
      aws_subnet.sb-pr-container-c.id
    ]
    security_groups  = [aws_security_group.sg-container.id]
    assign_public_ip = "false"
  }
  health_check_grace_period_seconds = "120"
  load_balancer {
    container_name   = "${local.app_name}-${local.env}"
    container_port   = "80"
    target_group_arn = aws_lb_target_group.tg-blue.arn
  }

  service_registries {
    registry_arn = aws_service_discovery_service.sds.arn
  }

  # 初期構築以降の定義変更の検知をしない
  # （初期構築以降はCircleCIでデプロイするため）
  lifecycle {
    ignore_changes = [
      task_definition,
      load_balancer,
      service_registries,
      desired_count,
    ]
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-ecs-sb"}, local.common_tags)
}

# Auto Scaling
resource "aws_appautoscaling_target" "as-target" {
  min_capacity       = 2
  max_capacity       = 4
  resource_id        = "service/${aws_ecs_cluster.ecs-cl.name}/${aws_ecs_service.ecs-sb.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "as-policy" {
  name        = "${local.app_name}-${local.env}-ecs-scalingpolicy"
  policy_type = "TargetTrackingScaling"
  resource_id = "service/${aws_ecs_cluster.ecs-cl.name}/${aws_ecs_service.ecs-sb.name}"

  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = 80
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }

  depends_on = [aws_appautoscaling_target.as-target]
}

resource "aws_service_discovery_service" "sds" {
  name = "${local.app_name}-${local.env}-ecs-sb"

  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.dnsn.id

    dns_records {
      ttl  = 60
      type = "A"
    }
    routing_policy = "MULTIVALUE"
  }
}

resource "aws_service_discovery_private_dns_namespace" "dnsn" {
  name = "${local.app_name}-${local.env}-local"
  vpc  = aws_vpc.vpc.id
}
