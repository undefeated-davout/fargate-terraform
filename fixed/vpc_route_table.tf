resource "aws_route_table" "rt-internet" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-rt-internet"}, local.common_tags)
}

resource "aws_route_table" "rt-app" {
  vpc_id = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-rt-app"}, local.common_tags)
}

resource "aws_route_table" "rt-manage" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-rt-manage"}, local.common_tags)
}
