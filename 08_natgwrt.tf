resource  "aws_route_table" "suuu_natgwrt" {
  vpc_id = aws_vpc.SUUUU.id

  route {
    cidr_block  =  "0.0.0.0/0"
    gateway_id  =  aws_nat_gateway.suuu_ng.id
  }

  tags = {
    "Name"  =  "suuu_natgwrt"
  }
}