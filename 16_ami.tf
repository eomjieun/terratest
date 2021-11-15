resource "aws_ami_from_instance" "suuu_ami1" {
  name               = "suuu-aws.ami1"
  source_instance_id = aws_instance.suuu_weba.id

  depends_on = [
    aws_instance.suuu_weba
  ] # 오류 날 수도 있으니 meta argument 작업 
  tags = {
    "Name" = "suuu_ami1"
  }
}