# ECR API呼び出し用（aws ecr loginコマンドなど）
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-ecr-api" {
  service_name      = "com.amazonaws.ap-northeast-1.ecr.api"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-egress-1a.id,
    aws_subnet.sample-dev-sb-pr-egress-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sample-dev-sg-vpc-endpoint.id]
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-vpc-ep-ecr-api"
  }
}

# ECR用（docker pushコマンドなどのDockerクライアントコマンド呼び出し用）
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-dkr" {
  service_name      = "com.amazonaws.ap-northeast-1.ecr.dkr"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-container-1a.id,
    aws_subnet.sample-dev-sb-pr-container-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sample-dev-sg-vpc-endpoint.id]
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-vpc-ep-dkr"
  }
}

# CloudWatchのlog用
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-logs" {
  service_name      = "com.amazonaws.ap-northeast-1.logs"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-db-1a.id,
    aws_subnet.sample-dev-sb-pr-db-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sample-dev-sg-vpc-endpoint.id]
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-vpc-ep-logs"
  }
}

# Systems Manager用（パラメータストア）
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-ssm" {
  service_name      = "com.amazonaws.ap-northeast-1.ssm"
  vpc_endpoint_type = "Interface"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  subnet_ids = [
    aws_subnet.sample-dev-sb-pr-container-1a.id,
    aws_subnet.sample-dev-sb-pr-container-1c.id
  ]
  private_dns_enabled = true
  security_group_ids  = [aws_security_group.sample-dev-sg-vpc-endpoint.id]
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-vpc-ep-ssm"
  }
}

# S3用はGateway型（Dockerイメージ取得用）
resource "aws_vpc_endpoint" "sample-dev-vpc-ep-s3" {
  service_name      = "com.amazonaws.ap-northeast-1.s3"
  vpc_endpoint_type = "Gateway"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  route_table_ids = [
    aws_route_table.sample-dev-rt-app.id,
    aws_route_table.sample-dev-rt-manage.id
  ]
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-vpc-ep-s3"
  }
}
