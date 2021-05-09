resource "aws_internet_gateway" "sample-dev-igw" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  tags = merge({"Name": "${var.app_name}-${var.env}-igw"}, var.common_tags)
}
