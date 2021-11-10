#10.0.0.0/16 VPC전용 Internet Gateway
resource "aws_internet_gateway" "jieun_ig" {
  vpc_id = aws_vpc.jieun_vpc.id

  tags = {
    "Name" = "jieun-ig"
  }
}