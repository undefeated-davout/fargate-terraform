resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge({"Name": "${local.app_name}-${local.env}-igw"}, local.common_tags)
}
