resource  "aws_lb_target_group"  "SUUUU-albtg"  {
  name  = "suuu-albtg"
  port  =  80
  protocol  =  "HTTP"
  vpc_id  =  aws_vpc.SUUUU.id

  health_check  {
    enabled  =  true
    healthy_threshold  =  3
    interval  =  5
    matcher  =  "200"
    path  =  "/index.html"
    port  =  "traffic-port"
    timeout  =  2
    unhealthy_threshold  =  2
  
  }
}