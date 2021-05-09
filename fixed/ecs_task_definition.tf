resource "aws_ecs_task_definition" "sample-dev-ecs-tk" {
  family                   = "sample-dev-ecs-tk"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.sample-dev-ecsTaskExecutionRole.arn
  cpu                      = "512"
  memory                   = "1024"
  container_definitions    = <<JSON
[
  {
    "name": "sample-dev",
    "image": "${aws_ecr_repository.sample-dev-ecr-repository.repository_url}:v1",
    "cpu": 256,
    "memoryReservation": 512,
    "essential": true,
    "network_mode": "awsvpc",
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${aws_cloudwatch_log_group.sample-dev-log.id}",
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
        "name": "sample-dev_DB_HOST",
        "valueFrom": "sample-dev-param-db-host"
      },
      {
        "name": "sample-dev_DB_NAME",
        "valueFrom": "sample-dev-param-db-name"
      },
      {
        "name": "sample-dev_DB_PASSWORD",
        "valueFrom": "sample-dev-param-db-password"
      },
      {
        "name": "sample-dev_DB_USERNAME",
        "valueFrom": "sample-dev-param-db-username"
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

  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-ecs-tk"
  }
}
