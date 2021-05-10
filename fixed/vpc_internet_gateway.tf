resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge({"Name": "${var.app_name}-${var.env}-igw"}, var.common_tags)
}
