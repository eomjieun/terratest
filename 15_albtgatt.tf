resource "aws_lb_target_group_attachment" "suuu_tgatt" {
  target_group_arn = aws_lb_target_group.suuu_albtg.arn
  target_id = aws_instance.suuu_weba.id
  port = 80
}
