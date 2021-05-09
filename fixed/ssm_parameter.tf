resource "aws_ssm_parameter" "sample-dev-param-db-host" {
  name        = "sample-dev-param-db-host"
  description = "DB host name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = aws_rds_cluster.sample-dev-rds-cl.endpoint
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-param-db-host"
  }
}

resource "aws_ssm_parameter" "sample-dev-param-db-name" {
  name        = "sample-dev-param-db-name"
  description = "DB name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = "hogehoge"
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-param-db-name"
  }
}

resource "aws_ssm_parameter" "sample-dev-param-db-password" {
  name        = "sample-dev-param-db-password"
  description = "DB user password"
  tier        = "Standard"
  type        = "SecureString"
  data_type   = "text"
  key_id      = "alias/aws/ssm"
  # Terraform上ではDB用パスワード情報は管理しない。
  # 初回定義作成後に手動変更する。
  value = "hogehoge"
  lifecycle {
    ignore_changes = [value]
  }

  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-param-db-password"
  }
}

resource "aws_ssm_parameter" "sample-dev-param-db-username" {
  name        = "sample-dev-param-db-username"
  description = "DB user name"
  tier        = "Standard"
  type        = "String"
  data_type   = "text"
  value       = "hogehoge"
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-param-db-username"
  }
}
