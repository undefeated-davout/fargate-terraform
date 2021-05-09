resource "aws_lb" "sample-dev-alb-ingress" {
  name               = "sample-dev-alb-ingress"
  load_balancer_type = "application"
  internal           = "false"
  ip_address_type    = "ipv4"
  subnets = [
    aws_subnet.sample-dev-sb-pb-ingress-1a.id,
    aws_subnet.sample-dev-sb-pb-ingress-1c.id
  ]
  security_groups = [aws_security_group.sample-dev-sg-ingress.id]
  tags = {
    Service = "sample-dev"
    Env     = "dev"
    Name    = "sample-dev-alb-ingress"
  }
}
