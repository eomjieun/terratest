resource "aws_ami_from_instance" "suuu_ami1" {
  name               = "${var.name}-aws.ami1"
  source_instance_id = aws_instance.suuu_web.id

  depends_on = [
    aws_instance.suuu_web
  ] # 오류 날 수도 있으니 meta argument 작업 
  tags = {
    "Name" = "${var.name}_ami1"
  }
}

resource "aws_launch_configuration" "suuu_aslc" {
  name_prefix          = "${var.name}-web-"
  image_id             = aws_ami_from_instance.suuu_ami1.id
  instance_type        = var.instance
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.suuu_sg.id]
  key_name             = var.key

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_placement_group" "suuu_place" {
  name     = "${var.name}-place"
  strategy = var.strategy
}


resource "aws_autoscaling_group" "suuu_asg" {
  name                      = "${var.name}-asg"
  min_size                  = 2
  max_size                  = 10
  health_check_grace_period = 10
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.suuu_aslc.name
  vpc_zone_identifier       = [aws_subnet.SUUUU_pub[0].id, aws_subnet.SUUUU_pub[1].id]
}

resource "aws_lb_target_group_attachment" "suuu_tgatt" {
  target_group_arn = aws_lb_target_group.suuu_albtg.arn
  target_id = aws_instance.suuu_web.id
  port = var.port_http
}


