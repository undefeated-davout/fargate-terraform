resource "aws_instance" "ec2-manage" {
  // Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-0ca38c7440de1749a (64 ビット x86)
  ami                         = "${local.manage_server_ami}"
  instance_type               = "t2.micro"
  availability_zone           = "${local.region}a"
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.sb-pb-manage-a.id
  vpc_security_group_ids      = [aws_security_group.sg-manage.id]
  key_name = "${local.pem_name}"
  # EBS
  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    delete_on_termination = "true"
    tags = merge({"Name": "${local.app_name}-${local.env}-ebs-manage"}, local.common_tags)
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-ec2-manage"}, local.common_tags)
}
