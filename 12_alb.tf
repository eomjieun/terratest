resource "aws_lb" "suuu_alb" {
  name               = "suuu-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.suuu_sg.id]
  subnets            = [aws_subnet.SUUUU_puba.id, aws_subnet.SUUUU_pubb.id]

  tags = {
    "Name" = "suuu_alb"
  }
}

output "alb_dns" {
    value = aws_lb.suuu_alb.dns_name  
}