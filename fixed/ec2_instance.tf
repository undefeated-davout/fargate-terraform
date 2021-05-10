resource "aws_instance" "sample-dev-ec2-manage" {
  // Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-0ca38c7440de1749a (64 ビット x86)
  ami                         = "ami-0ca38c7440de1749a"
  instance_type               = "t2.micro"
  availability_zone           = "${var.region}a"
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.sample-dev-sb-pb-manage-1a.id
  vpc_security_group_ids      = [aws_security_group.sample-dev-sg-manage.id]
  key_name = "${var.pem_name}"
  # EBS
  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    delete_on_termination = "true"
    tags = merge({"Name": "${var.app_name}-${var.env}-ebs-manage"}, var.common_tags)
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-ec2-manage"}, var.common_tags)
}
