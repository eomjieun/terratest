resource "aws_route_table" "jieun_rf {
  vpc_id = aws_vpc.jieun_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jieun_ig.id
  }
  tags = {
    "Name" = "jieun-rt"
  }
}