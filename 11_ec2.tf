/*
data "aws_ami"  "amzn" {
  most_recent =
  filter {
    name  =  "name"
    values  =  ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name  =  "virtualization-type"
    values  =  ["hvm"]
  }
  owners = ["amazon"]
}
*/

resource "aws_instance" "suuu_weba" {
  ami                    = "ami-0a5a6128e65676ebb"
  instance_type          = "t2.micro"
  key_name               = "suuu-key" #00_key 첫 줄이 아니고 key_name이 와야함!!!
  availability_zone      = "ap-northeast-2a"
  private_ip             = "10.0.0.11" #주석처리도 해도 가능! 자동으로 할당받음
  subnet_id              = aws_subnet.SUUUU_puba.id
  vpc_security_group_ids = [aws_security_group.suuu_sg.id]
  user_data              = file("./intall.sh")
  tags = {
    "Name" = "suuu_weba"
  }
}

resource "aws_eip" "suuu_weba_ip" {
  vpc                       = true
  instance                  = aws_instance.suuu_weba.id
  associate_with_private_ip = "10.0.0.11"
  depends_on = [
    aws_internet_gateway.suuu_ig
  ]
}

output "public_ip" {
  value = aws_instance.suuu_weba.public_ip
}