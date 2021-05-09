resource "aws_internet_gateway" "sample-dev-igw" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-igw"
  }
}
