resource "aws_route_table" "sample-dev-rt-internet" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-dev-igw.id
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-rt-internet"}, var.common_tags)
}

resource "aws_route_table" "sample-dev-rt-app" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  tags = merge({"Name": "${var.app_name}-${var.env}-rt-app"}, var.common_tags)
}

resource "aws_route_table" "sample-dev-rt-manage" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-dev-igw.id
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-rt-manage"}, var.common_tags)
}
