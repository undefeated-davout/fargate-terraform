resource "aws_iam_role_policy_attachment" "sample-dev-ecsTaskExecutionRole-attach" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.sample-dev-ecsTaskExecutionRole.id
}

resource "aws_iam_role_policy_attachment" "sample-dev-ecsTaskExecutionRole-GettingParameterStorePolicy-attach" {
  policy_arn = aws_iam_policy.sample-dev-GettingParameterStorePolicy.arn
  role       = aws_iam_role.sample-dev-ecsTaskExecutionRole.id
}

resource "aws_iam_role_policy_attachment" "sample-dev-rds-monitoring-attach" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = aws_iam_role.sample-dev-rds-monitoring-role.id
}
