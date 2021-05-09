resource "aws_route_table" "sample-dev-rt-internet" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-dev-igw.id
  }

  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-rt-internet"
  }
}

resource "aws_route_table" "sample-dev-rt-app" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-rt-app"
  }
}

resource "aws_route_table" "sample-dev-rt-manage" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-dev-igw.id
  }

  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-rt-manage"
  }
}
