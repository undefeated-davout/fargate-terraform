resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole-attach" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.ecsTaskExecutionRole.id
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole-GettingParameterStorePolicy-attach" {
  policy_arn = aws_iam_policy.GettingParameterStorePolicy.arn
  role       = aws_iam_role.ecsTaskExecutionRole.id
}

resource "aws_iam_role_policy_attachment" "rds-monitoring-attach" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  role       = aws_iam_role.rds-monitoring-role.id
}
