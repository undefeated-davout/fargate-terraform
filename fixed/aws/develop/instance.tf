resource "aws_instance" "sample-dev-ec2-manage" {
  key_name = "cnapp_key" // 適宜pem名で書き換える
  // Amazon Linux 2 AMI (HVM), SSD Volume Type - ami-0ca38c7440de1749a (64 ビット x86)
  ami                         = "ami-0ca38c7440de1749a"
  instance_type               = "t2.micro"
  availability_zone           = "ap-northeast-1a"
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.sample-dev-sb-pb-manage-1a.id
  vpc_security_group_ids      = [aws_security_group.sample-dev-sg-manage.id]

  # EBS
  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    delete_on_termination = "true"
    tags = {
      Service = "sample-dev"
      Env     = "dev"
      Name    = "sample-dev-ebs-manage"
    }
  }

  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-ec2-manage"
  }
}