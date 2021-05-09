resource "aws_route_table" "sample-dev-rt-internet" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-dev-igw.id
  }

  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-rt-internet"
  }
}

resource "aws_route_table" "sample-dev-rt-app" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-rt-app"
  }
}

resource "aws_route_table" "sample-dev-rt-manage" {
  vpc_id = aws_vpc.sample-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sample-dev-igw.id
  }

  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-rt-manage"
  }
}
