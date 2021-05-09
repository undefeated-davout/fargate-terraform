resource "aws_ecs_cluster" "sample-dev-ecs-cluster" {
  name               = "sample-dev-ecs-cluster"
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
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-ecs-cluster"
  }
}
