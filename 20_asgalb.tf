resource "aws_autoscaling_attachment" "suuu_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.suuu_asg.id
  alb_target_group_arn = aws_lb_target_group.suuu_albtg.arn
}