resource  "aws_eip"  "suuu_ng" {
  vpc = true
}

resource  "aws_nat_gateway"   "suuu_ng" {
  allocation_id  =  aws_eip.suuu_ng.id
  subnet_id      =  aws_subnet.SUUUU_pub[0].id
  tags = {
    Name = "${var.name}-ng"
  }
  depends_on = [
    aws_internet_gateway.suuu_ig
  ]
}

resource  "aws_route_table" "suuu_natgwrt" {
  vpc_id = aws_vpc.SUUUU.id

  route {
    cidr_block  =  "0.0.0.0/0"
    gateway_id  =  aws_nat_gateway.suuu_ng.id
  }

  tags = {
    "Name"  =  "${var.name}_natgwrt"
  }
}

resource "aws_route_table_association"  "suuu_natgwass" {
  count = length(var.cidr_private)
  subnet_id  =  aws_subnet.SUUUU_pri[count.index].id
  route_table_id  =  aws_route_table.suuu_natgwrt.id
}
