resource "aws_iam_policy" "sample-dev-GettingParameterStorePolicy" {
  name   = "sample-dev-GettingParameterStorePolicy"
  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ssm:GetParameters",
        "secretsmanager:GetSecretValue"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-GettingParameterStorePolicy"
  }
}
