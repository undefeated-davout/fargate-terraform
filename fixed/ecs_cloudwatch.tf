resource "aws_cloudwatch_log_group" "log" {
  name              = "/ecs/${local.app_name}-${local.env}-ecs-tk"
  retention_in_days = 30
}
