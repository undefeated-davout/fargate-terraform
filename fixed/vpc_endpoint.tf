# ECR API呼び出し用（aws ecr loginコマンドなど）
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-ecr-api" {
  service_name      = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-egress-1a.id,
    aws_subnet.sample-dev-sb-pr-egress-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sample-dev-sg-vpc-endpoint.id]
  tags = merge({"Name": "${var.app_name}-${var.env}-vpc-ep-ecr-api"}, var.common_tags)
}

# ECR用（docker pushコマンドなどのDockerクライアントコマンド呼び出し用）
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-dkr" {
  service_name      = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-container-1a.id,
    aws_subnet.sample-dev-sb-pr-container-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sample-dev-sg-vpc-endpoint.id]
  tags = merge({"Name": "${var.app_name}-${var.env}-vpc-ep-dkr"}, var.common_tags)
}

# CloudWatchのlog用
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-logs" {
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-db-1a.id,
    aws_subnet.sample-dev-sb-pr-db-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sample-dev-sg-vpc-endpoint.id]
  tags = merge({"Name": "${var.app_name}-${var.env}-vpc-ep-logs"}, var.common_tags)
}

# Systems Manager用（パラメータストア）
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-ssm" {
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-container-1a.id,
    aws_subnet.sample-dev-sb-pr-container-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sample-dev-sg-vpc-endpoint.id]
  tags = merge({"Name": "${var.app_name}-${var.env}-vpc-ep-ssm"}, var.common_tags)
}

# S3用はGateway型（Dockerイメージ取得用）
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-s3" {
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  route_table_ids = [
    aws_route_table.sample-dev-rt-app.id,
    aws_route_table.sample-dev-rt-manage.id
  ]
  tags = merge({"Name": "${var.app_name}-${var.env}-vpc-ep-s3"}, var.common_tags)
}
