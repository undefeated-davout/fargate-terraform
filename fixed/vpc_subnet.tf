# Ingress用
resource "aws_subnet" "sb-pb-ingress-1a" {
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pb-ingress-1a"}, local.common_tags)
}

resource "aws_subnet" "sb-pb-ingress-1c" {
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pb-ingress-1c"}, local.common_tags)
}

# コンテナ用
resource "aws_subnet" "sb-pr-container-1a" {
  cidr_block        = "10.0.8.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-container-1a"}, local.common_tags)
}

resource "aws_subnet" "sb-pr-container-1c" {
  cidr_block        = "10.0.9.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-container-1c"}, local.common_tags)
}

# DB用
resource "aws_subnet" "sb-pr-db-1a" {
  cidr_block        = "10.0.16.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-db-1a"}, local.common_tags)
}

resource "aws_subnet" "sb-pr-db-1c" {
  cidr_block        = "10.0.17.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-db-1c"}, local.common_tags)
}

# 踏み台サーバ用
resource "aws_subnet" "sb-pb-manage-1a" {
  cidr_block        = "10.0.240.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pb-manage-1a"}, local.common_tags)
}
# 踏み台サーバ用（予備）
resource "aws_subnet" "sb-pb-manage-1c" {
  cidr_block        = "10.0.241.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pb-manage-1c"}, local.common_tags)
}

# Engress用（ECR、CloudWatchアクセス）
resource "aws_subnet" "sb-pr-egress-1a" {
  cidr_block        = "10.0.248.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-egress-1a"}, local.common_tags)
}

resource "aws_subnet" "sb-pr-egress-1c" {
  cidr_block        = "10.0.249.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-egress-1c"}, local.common_tags)
}
