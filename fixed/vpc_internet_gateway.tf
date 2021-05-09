resource "aws_internet_gateway" "sample-dev-igw" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  tags = {
    "Service": "${var.app_name}-${var.env}"
    "Env": "${var.env}"
    "Name": "${var.app_name}-${var.env}-igw"
  }
}
