output elb_listner {
  value       = "${aws_lb_listener.alb-https.id}"
}

output elb_id {
  value       = "${aws_lb.alb.id}"
}

output elb_dns_name {
  value       = "${aws_lb.alb.dns_name}"
}

output elb_zone_id {
  value       = "${aws_lb.alb.zone_id}"
}
