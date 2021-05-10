resource "aws_iam_policy" "GettingParameterStorePolicy" {
  name   = "${local.app_name}-${local.env}-GettingParameterStorePolicy"
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
  tags = merge({"Name": "${local.app_name}-${local.env}-GettingParameterStorePolicy"}, local.common_tags)
}
