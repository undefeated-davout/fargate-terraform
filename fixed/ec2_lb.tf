resource "aws_lb" "alb-ingress" {
  name               = "${local.app_name}-${local.env}-alb-ingress"
  load_balancer_type = "application"
  internal           = "false"
  ip_address_type    = "ipv4"
  subnets = [
    aws_subnet.sb-pb-ingress-1a.id,
    aws_subnet.sb-pb-ingress-1c.id
  ]
  security_groups = [aws_security_group.sg-ingress.id]
  tags = merge({"Name": "${local.app_name}-${local.env}-alb-ingress"}, local.common_tags)
}
