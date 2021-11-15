resource "aws_launch_configuration" "suuu_aslc" {
  name_prefix          = "suuu-web-"
  image_id             = aws_ami_from_instance.suuu_ami1.id
  instance_type        = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.suuu_sg.id]
  key_name             = "suuu-key"

  lifecycle {
    create_before_destroy = true
  }
}