# Ingress用
resource "aws_subnet" "sb-pb-ingress-a" {
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pb-ingress-a"}, local.common_tags)
}

resource "aws_subnet" "sb-pb-ingress-c" {
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pb-ingress-c"}, local.common_tags)
}

# コンテナ用
resource "aws_subnet" "sb-pr-container-a" {
  cidr_block        = "10.0.8.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-container-a"}, local.common_tags)
}

resource "aws_subnet" "sb-pr-container-c" {
  cidr_block        = "10.0.9.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-container-c"}, local.common_tags)
}

# DB用
resource "aws_subnet" "sb-pr-db-a" {
  cidr_block        = "10.0.16.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-db-a"}, local.common_tags)
}

resource "aws_subnet" "sb-pr-db-c" {
  cidr_block        = "10.0.17.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-db-c"}, local.common_tags)
}

# 踏み台サーバ用
resource "aws_subnet" "sb-pb-manage-a" {
  cidr_block        = "10.0.240.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pb-manage-a"}, local.common_tags)
}
# 踏み台サーバ用（予備）
resource "aws_subnet" "sb-pb-manage-c" {
  cidr_block        = "10.0.241.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pb-manage-c"}, local.common_tags)
}

# Engress用（ECR、CloudWatchアクセス）
resource "aws_subnet" "sb-pr-egress-a" {
  cidr_block        = "10.0.248.0/24"
  availability_zone = "${local.region}a"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-egress-a"}, local.common_tags)
}

resource "aws_subnet" "sb-pr-egress-c" {
  cidr_block        = "10.0.249.0/24"
  availability_zone = "${local.region}c"
  vpc_id            = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-sb-pr-egress-c"}, local.common_tags)
}
