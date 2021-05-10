resource "aws_ecs_cluster" "ecs-cl" {
  name               = "${local.app_name}-${local.env}-ecs-cl"
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
  tags = merge({"Name": "${local.app_name}-${local.env}-ecs-cl"}, local.common_tags)
}
