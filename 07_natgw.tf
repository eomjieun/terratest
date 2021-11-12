resource  "aws_eip"  "suuu_ng" {
  vpc = true
}

resource  "aws_nat_gateway"   "suuu_ng" {
  allocation_id  =  aws_eip.suuu_ng.id
  subnet_id      =  aws_subnet.SUUUU_pubb.id
  tags = {
    Name = "suuu-ng"
  }
  depends_on = [
    aws_internet_gateway.suuu_ig
  ]
}