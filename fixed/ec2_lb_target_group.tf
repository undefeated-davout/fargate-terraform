resource "aws_lb_target_group" "sample-dev-tg-blue" {
  name        = "sample-dev-tg-blue"
  vpc_id      = aws_vpc.sample-dev-vpc.id
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
  tags = merge({"Name": "${var.app_name}-${var.env}-tg-blue"}, var.common_tags)
}

resource "aws_lb_target_group" "sample-dev-tg-green" {
  name        = "sample-dev-tg-green"
  vpc_id      = aws_vpc.sample-dev-vpc.id
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
  tags = merge({"Name": "${var.app_name}-${var.env}-tg-green"}, var.common_tags)
}
