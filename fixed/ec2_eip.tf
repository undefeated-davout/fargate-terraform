resource "aws_eip" "eip-manage" {
  network_border_group = "${local.region}"
  instance             = aws_instance.ec2-manage.id
  vpc                  = "true"
  depends_on           = [aws_internet_gateway.igw]
  tags = merge({"Name": "${local.app_name}-${local.env}-eip-manage"}, local.common_tags)
}
