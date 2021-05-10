resource "aws_iam_role" "ecsTaskExecutionRole" {
  name = "${local.app_name}-${local.env}-ecsTaskExecutionRole"
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
    aws_iam_policy.GettingParameterStorePolicy.arn
  ]
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Sid": ""
    }
  ],
  "Version": "2008-10-17"
}
POLICY
}

resource "aws_iam_role" "rds-monitoring-role" {
  name               = "${local.app_name}-${local.env}-rds-monitoring-role"
  assume_role_policy = data.aws_iam_policy_document.rds-monitoring.json
}
data "aws_iam_policy_document" "rds-monitoring" {
  version = "2012-10-17"
  statement {
    sid    = "RDSMonitoringRole"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["monitoring.rds.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}
