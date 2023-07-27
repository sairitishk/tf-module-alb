resource "aws_lb_listener" "alb-https" {
  load_balancer_arn = aws_lb.alb-new.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  certificate_arn   = var.alb_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.albtest.arn
  }
}

resource "aws_lb_listener" "alb-https-redirect" {
  load_balancer_arn = aws_lb.alb-new.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}