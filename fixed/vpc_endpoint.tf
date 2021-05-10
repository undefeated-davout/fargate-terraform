# ECR API呼び出し用（aws ecr loginコマンドなど）
resource "aws_vpc_endpoint" "vpc-ep-ecr-api" {
  service_name      = "com.amazonaws.${local.region}.ecr.api"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.vpc.id
  subnet_ids = [
    aws_subnet.sb-pr-egress-1a.id,
    aws_subnet.sb-pr-egress-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sg-vpc-endpoint.id]
  tags = merge({"Name": "${local.app_name}-${local.env}-vpc-ep-ecr-api"}, local.common_tags)
}

# ECR用（docker pushコマンドなどのDockerクライアントコマンド呼び出し用）
resource "aws_vpc_endpoint" "vpc-ep-dkr" {
  service_name      = "com.amazonaws.${local.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.vpc.id
  subnet_ids = [
    aws_subnet.sb-pr-container-1a.id,
    aws_subnet.sb-pr-container-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sg-vpc-endpoint.id]
  tags = merge({"Name": "${local.app_name}-${local.env}-vpc-ep-dkr"}, local.common_tags)
}

# CloudWatchのlog用
resource "aws_vpc_endpoint" "vpc-ep-logs" {
  service_name      = "com.amazonaws.${local.region}.logs"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.vpc.id
  subnet_ids = [
    aws_subnet.sb-pr-db-1a.id,
    aws_subnet.sb-pr-db-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sg-vpc-endpoint.id]
  tags = merge({"Name": "${local.app_name}-${local.env}-vpc-ep-logs"}, local.common_tags)
}

# Systems Manager用（パラメータストア）
resource "aws_vpc_endpoint" "vpc-ep-ssm" {
  service_name      = "com.amazonaws.${local.region}.ssm"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.vpc.id
  subnet_ids = [
    aws_subnet.sb-pr-container-1a.id,
    aws_subnet.sb-pr-container-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sg-vpc-endpoint.id]
  tags = merge({"Name": "${local.app_name}-${local.env}-vpc-ep-ssm"}, local.common_tags)
}

# S3用はGateway型（Dockerイメージ取得用）
resource "aws_vpc_endpoint" "vpc-ep-s3" {
  service_name      = "com.amazonaws.${local.region}.s3"
  vpc_endpoint_type = "Gateway"
  vpc_id            = aws_vpc.vpc.id
  route_table_ids = [
    aws_route_table.rt-app.id,
    aws_route_table.rt-manage.id
  ]
  tags = merge({"Name": "${local.app_name}-${local.env}-vpc-ep-s3"}, local.common_tags)
}
