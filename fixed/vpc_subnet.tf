# Ingress用
resource "aws_subnet" "sample-dev-sb-pb-ingress-1a" {
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pb-ingress-1a"
  }
}

resource "aws_subnet" "sample-dev-sb-pb-ingress-1c" {
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}c"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pb-ingress-1c"
  }
}

# コンテナ用
resource "aws_subnet" "sample-dev-sb-pr-container-1a" {
  cidr_block        = "10.0.8.0/24"
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pr-container-1a"
  }
}

resource "aws_subnet" "sample-dev-sb-pr-container-1c" {
  cidr_block        = "10.0.9.0/24"
  availability_zone = "${var.region}c"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    Env = "dev"

    Name = "sample-dev-sb-pr-container-1c"
  }
}

# DB用
resource "aws_subnet" "sample-dev-sb-pr-db-1a" {
  cidr_block        = "10.0.16.0/24"
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pr-db-1a"
  }
}

resource "aws_subnet" "sample-dev-sb-pr-db-1c" {
  cidr_block        = "10.0.17.0/24"
  availability_zone = "${var.region}c"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pr-db-1c"
  }
}

# 踏み台サーバ用
resource "aws_subnet" "sample-dev-sb-pb-manage-1a" {
  cidr_block        = "10.0.240.0/24"
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pb-manage-1a"
  }
}
# 踏み台サーバ用（予備）
resource "aws_subnet" "sample-dev-sb-pb-manage-1c" {
  cidr_block        = "10.0.241.0/24"
  availability_zone = "${var.region}c"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pb-manage-1c"
  }
}

# Engress用（ECR、CloudWatchアクセス）
resource "aws_subnet" "sample-dev-sb-pr-egress-1a" {
  cidr_block        = "10.0.248.0/24"
  availability_zone = "${var.region}a"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pr-egress-1a"
  }
}

resource "aws_subnet" "sample-dev-sb-pr-egress-1c" {
  cidr_block        = "10.0.249.0/24"
  availability_zone = "${var.region}c"
  vpc_id            = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-sb-pr-egress-1c"
  }
}
