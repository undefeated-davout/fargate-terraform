resource "aws_cloudwatch_log_group" "log" {
  name              = "/ecs/ecs-tk"
  retention_in_days = 30
}
