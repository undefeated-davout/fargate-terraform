resource "aws_ecs_task_definition" "ecs-tk" {
  family                   = "${local.app_name}-${local.env}-ecs-tk"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  cpu                      = "512"
  memory                   = "1024"
  container_definitions    = <<JSON
[
  {
    "name": "${local.app_name}-${local.env}",
    "image": "${aws_ecr_repository.ecr-repository.repository_url}:${local.image_target_tag}",
    "cpu": 256,
    "memoryReservation": 512,
    "essential": true,
    "network_mode": "awsvpc",
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${aws_cloudwatch_log_group.log.id}",
        "awslogs-region": "${local.region}",
        "awslogs-stream-prefix": "ecs"
      }
    },
    "portMappings": [
      {
        "hostPort": 80,
        "protocol": "tcp",
        "containerPort": 80
      }
    ],
    "secrets": [
      {
        "name": "${local.app_name}-${local.env}_DB_HOST",
        "valueFrom": "${local.app_name}-${local.env}-param-db-host"
      },
      {
        "name": "${local.app_name}-${local.env}_DB_NAME",
        "valueFrom": "${local.app_name}-${local.env}-param-db-name"
      },
      {
        "name": "${local.app_name}-${local.env}_DB_USERNAME",
        "valueFrom": "${local.app_name}-${local.env}-param-db-username"
      },
      {
        "name": "${local.app_name}-${local.env}_DB_PASSWORD",
        "valueFrom": "${local.app_name}-${local.env}-param-db-password"
      },
      {
        "name": "${local.app_name}-${local.env}_S3_BUCKET_NAME",
        "valueFrom": "${local.app_name}-${local.env}-param-s3-bucket-name"
      }
    ]
  }
]
JSON

  # 初期構築以降の定義変更の検知をしない
  # （初期構築以降はCircleCIでデプロイするため）
  lifecycle {
    ignore_changes = [container_definitions]
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-ecs-tk"}, local.common_tags)
}
