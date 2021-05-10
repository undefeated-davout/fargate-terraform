resource "aws_security_group" "sg-ingress" {
  name        = "sg-ingress"
  description = "sg of Ingress"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    protocol    = "tcp"
    from_port   = "80"
    to_port     = "80"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP internal for manage"
    protocol    = "tcp"
    from_port   = "10080"
    to_port     = "10080"
    cidr_blocks = ["54.150.235.157/32"]
  }
  egress {
    protocol    = "-1"
    from_port   = "0"
    to_port     = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-sg-ingress"}, var.common_tags)
}

resource "aws_security_group" "sg-container" {
  name        = "sg-container"
  description = "sg of VPC Container App"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description     = "HTTP for Ingress"
    protocol        = "tcp"
    from_port       = "80"
    to_port         = "80"
    security_groups = [aws_security_group.sg-ingress.id]
  }
  ingress {
    description     = "HTTP for manage"
    protocol        = "tcp"
    from_port       = "80"
    to_port         = "80"
    security_groups = [aws_security_group.sg-manage.id]
  }
  ingress {
    description     = "ICMP for manage"
    protocol        = "icmp"
    from_port       = "-1"
    to_port         = "-1"
    security_groups = [aws_security_group.sg-manage.id]
  }
  egress {
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    to_port     = "0"
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-sg-container"}, var.common_tags)
}

resource "aws_security_group" "sg-db" {
  name        = "sg-db"
  description = "sg of DB"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description     = "MySQL protocol from Container App"
    protocol        = "tcp"
    from_port       = "3306"
    to_port         = "3306"
    security_groups = [aws_security_group.sg-container.id]
  }
  ingress {
    description     = "MySQL protocol from manage"
    protocol        = "tcp"
    from_port       = "3306"
    to_port         = "3306"
    security_groups = [aws_security_group.sg-manage.id]
  }
  egress {
    protocol    = "-1"
    from_port   = "0"
    to_port     = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-sg-db"}, var.common_tags)
}

resource "aws_security_group" "sg-manage" {
  name        = "sg-manage"
  description = "sg of manage"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    protocol    = "tcp"
    from_port   = "60022"
    to_port     = "60022"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol    = "-1"
    from_port   = "0"
    to_port     = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-sg-manage"}, var.common_tags)
}

resource "aws_security_group" "sg-vpc-endpoint" {
  name        = "sg-vpc-endpoint"
  description = "sg of VPC Endpoint"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    description     = "HTTPS for Container App"
    protocol        = "tcp"
    from_port       = "443"
    to_port         = "443"
    security_groups = [aws_security_group.sg-container.id]
  }
  ingress {
    description     = "HTTPS for manage EC2"
    protocol        = "tcp"
    from_port       = "443"
    to_port         = "443"
    security_groups = [aws_security_group.sg-manage.id]
  }
  egress {
    from_port   = "0"
    protocol    = "-1"
    to_port     = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge({"Name": "${var.app_name}-${var.env}-sg-vpc-endpoint"}, var.common_tags)
}
