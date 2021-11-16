#Application LoadBalancer
resource "aws_lb" "suuu_alb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = var.load_type
  security_groups    = [aws_security_group.suuu_sg.id]
  subnets            = [aws_subnet.SUUUU_pub[0].id, aws_subnet.SUUUU_pub[1].id]

  tags = {
    "Name" = "${var.name}_alb"
  }
}

output "alb_dns" {
    value = aws_lb.suuu_alb.dns_name  
}

resource "aws_lb_target_group" "suuu_albtg" {
  name = "${var.name}-albtg"
  port = var.port_http
  protocol = var.protocol_http1
  vpc_id = aws_vpc.SUUUU.id
  
  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 5
    matcher = "200"
    path = "/index.html"
    port = "traffic-port"
    protocol = var.protocol_http1
    timeout = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "suuu_albli" {
  load_balancer_arn = aws_lb.suuu_alb.arn
  port              = var.port_http
  protocol          = var.protocol_http1

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.suuu_albtg.arn
  }
}



