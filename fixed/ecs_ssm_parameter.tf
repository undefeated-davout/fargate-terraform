// DB
resource "aws_ssm_parameter" "param-db-host" {
  name        = "${local.app_name}-${local.env}-param-db-host"
  description = "DB host name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = "${local.db_endpoint}"
  tags = merge({"Name": "${local.app_name}-${local.env}-param-db-host"}, local.common_tags)
}

resource "aws_ssm_parameter" "param-db-name" {
  name        = "${local.app_name}-${local.env}-param-db-name"
  description = "DB name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = "${local.db_name}"
  tags = merge({"Name": "${local.app_name}-${local.env}-param-db-name"}, local.common_tags)
}

resource "aws_ssm_parameter" "param-db-username" {
  name        = "${local.app_name}-${local.env}-param-db-username"
  description = "DB user name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = "${local.db_user_name}"
  tags = merge({"Name": "${local.app_name}-${local.env}-param-db-username"}, local.common_tags)
}

resource "aws_ssm_parameter" "param-db-password" {
  name        = "${local.app_name}-${local.env}-param-db-password"
  description = "DB user password"
  tier        = "Standard"
  type        = "SecureString"
  data_type   = "text"
  key_id      = "alias/aws/ssm"
  # Terraform上ではDB用パスワード情報は管理しない。
  # 初回定義作成後に手動変更する。
  value = "${local.db_password}"
  lifecycle {
    ignore_changes = [value]
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-param-db-password"}, local.common_tags)
}

// S3
resource "aws_ssm_parameter" "param-s3-bucket-name" {
  name        = "${local.app_name}-${local.env}-param-s3-bucket-name"
  description = "DB user name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = "${local.s3_bucket_name}"
  tags = merge({"Name": "${local.app_name}-${local.env}-param-s3-bucket-name"}, local.common_tags)
}
