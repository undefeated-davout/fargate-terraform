resource "aws_lb_target_group" "tg-blue" {
  name        = "${local.app_name}-${local.env}-tg-blue"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"
  protocol    = "HTTP"
  port        = "80"

  health_check {
    port                = "traffic-port"
    protocol            = "HTTP"
    path                = "/healthcheck"
    healthy_threshold   = "3"
    unhealthy_threshold = "2"
    timeout             = "5"
    interval            = "15"
    matcher             = "200"
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-tg-blue"}, local.common_tags)
}

resource "aws_lb_target_group" "tg-green" {
  name        = "${local.app_name}-${local.env}-tg-green"
  vpc_id      = aws_vpc.vpc.id
  target_type = "ip"
  protocol    = "HTTP"
  port        = "80"

  health_check {
    port                = "traffic-port"
    protocol            = "HTTP"
    path                = "/healthcheck"
    healthy_threshold   = "3"
    unhealthy_threshold = "2"
    timeout             = "5"
    interval            = "15"
    matcher             = "200"
  }
  tags = merge({"Name": "${local.app_name}-${local.env}-tg-green"}, local.common_tags)
}
