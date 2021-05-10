resource "aws_lb_listener" "lb-listener-blue" {
  load_balancer_arn = aws_lb.alb-ingress.arn
  protocol          = "HTTP"
  port              = "80"

  default_action {
    type             = "forward"
    order            = "1"
    target_group_arn = aws_lb_target_group.tg-blue.arn
  }
}

resource "aws_lb_listener" "lb-listener-green" {
  load_balancer_arn = aws_lb.alb-ingress.arn
  protocol          = "HTTP"
  port              = "10080"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-green.arn
  }
}
