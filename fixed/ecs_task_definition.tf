resource "aws_ecs_task_definition" "ecs-tk" {
  family                   = "ecs-tk"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  cpu                      = "512"
  memory                   = "1024"
  container_definitions    = <<JSON
[
  {
    "name": "${var.app_name}-${var.env}",
    "image": "${aws_ecr_repository.ecr-repository.repository_url}:v1",
    "cpu": 256,
    "memoryReservation": 512,
    "essential": true,
    "network_mode": "awsvpc",
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${aws_cloudwatch_log_group.log.id}",
        "awslogs-region": "${var.region}",
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
        "name": "${var.app_name}-${var.env}_DB_HOST",
        "valueFrom": "param-db-host"
      },
      {
        "name": "${var.app_name}-${var.env}_DB_NAME",
        "valueFrom": "param-db-name"
      },
      {
        "name": "${var.app_name}-${var.env}_DB_PASSWORD",
        "valueFrom": "param-db-password"
      },
      {
        "name": "${var.app_name}-${var.env}_DB_USERNAME",
        "valueFrom": "param-db-username"
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
  tags = merge({"Name": "${var.app_name}-${var.env}-ecs-tk"}, var.common_tags)
}
