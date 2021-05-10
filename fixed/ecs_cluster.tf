resource "aws_ecs_cluster" "ecs-cluster" {
  name               = "ecs-cluster"
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  default_capacity_provider_strategy {
    base              = "0"
    capacity_provider = "FARGATE"
    weight            = "1"
  }
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-ecs-cluster"}, local.common_tags)
}
