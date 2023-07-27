resource "aws_lb" "alb-new" {
    private = false
    load_balancer_type = "application"
    security_groups = [var.sg_id]
    subnets = var.subnets
    enable_dns_protection = false
    tags = {
        Name = "${var.vpc_name}-ALB"
        Environment = var.env
    }
}

resource "aws_lb_target_group" "albtest" {
  name     = var.albtgname
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}


resource "aws_lb_target_group_attachment" "albtest" {
  count = "${var.env == "Production" ? 3 : 1}"
  target_group_arn = aws_lb_target_group.albtest.arn
  target_id        = "${element(var.private_servers, count.index)}"
  port             = 80
}