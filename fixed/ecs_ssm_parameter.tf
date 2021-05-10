resource "aws_ssm_parameter" "param-db-host" {
  name        = "param-db-host"
  description = "DB host name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = aws_rds_cluster.rds-cl.endpoint
  tags = merge({"Name": "${var.app_name}-${var.env}-param-db-host"}, var.common_tags)
}

resource "aws_ssm_parameter" "param-db-name" {
  name        = "param-db-name"
  description = "DB name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = "hogehoge"
  tags = merge({"Name": "${var.app_name}-${var.env}-param-db-name"}, var.common_tags)
}

resource "aws_ssm_parameter" "param-db-password" {
  name        = "param-db-password"
  description = "DB user password"
  tier        = "Standard"
  type        = "SecureString"
  data_type   = "text"
  key_id      = "alias/aws/ssm"
  # Terraform上ではDB用パスワード情報は管理しない。
  # 初回定義作成後に手動変更する。
  value = "${var.db_password}"
  lifecycle {
    ignore_changes = [value]
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-param-db-password"}, var.common_tags)
}

resource "aws_ssm_parameter" "param-db-username" {
  name        = "param-db-username"
  description = "DB user name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = "hogehoge"
  tags = merge({"Name": "${var.app_name}-${var.env}-param-db-username"}, var.common_tags)
}
