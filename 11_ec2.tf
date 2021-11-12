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
  ami = "ami-04e8dfc09b22389ad"
  instance_type = "t2.micro"
  key_name = "suuu-key"
  availability_zone = "ap-northeast-2a"
  private_ip = "10.0.0.11"
  subnet_id = aws_subnet.SUUUU_puba.id
  vpc_security_group_ids = [aws_security_group.suuu_sg.id]
  user_data = <<-EOF
                #!/bin/bash
                yum install -y httpd
                echo "suuu-Terraform-1" >> /var/www/html/index.html
                systemctl start httpd
                systemctl enable httpd
                EOF
}

resource "aws_eip" "suuu_weba_ip" {
  vpc = true
  instance = aws_instance.suuu_weba.id
  associate_with_private_ip = "10.0.0.11"
  depends_on = [
    aws_internet_gateway.suuu_ig
  ]
}