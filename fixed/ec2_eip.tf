resource "aws_eip" "eip-manage" {
  network_border_group = "${var.region}"
  instance             = aws_instance.ec2-manage.id
  vpc                  = "true"
  depends_on           = [aws_internet_gateway.igw]
  tags = merge({"Name": "${var.app_name}-${var.env}-eip-manage"}, var.common_tags)
}
