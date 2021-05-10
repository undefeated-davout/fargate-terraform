resource "aws_route_table" "rt-internet" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-rt-internet"}, var.common_tags)
}

resource "aws_route_table" "rt-app" {
  vpc_id = aws_vpc.vpc.id
  tags = merge({"Name": "${var.app_name}-${var.env}-rt-app"}, var.common_tags)
}

resource "aws_route_table" "rt-manage" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-rt-manage"}, var.common_tags)
}
