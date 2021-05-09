resource "aws_eip" "sample-dev-eip-manage" {
  network_border_group = "${var.region}"
  instance             = aws_instance.sample-dev-ec2-manage.id
  vpc                  = "true"
  depends_on           = [aws_internet_gateway.sample-dev-igw]
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-eip-manage"
  }
}
