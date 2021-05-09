resource "aws_cloudwatch_log_group" "sample-dev-log" {
  name              = "/ecs/sample-dev-ecs-tk"
  retention_in_days = 30
}
