resource "aws_route_table_association"  "suuu_natgwass_a" {
  subnet_id  =  aws_subnet.SUUUU_pria.id
  route_table_id  =  aws_route_table.suuu_natgwrt.id
}

resource "aws_route_table_association"  "suuu_natgwass_b" {
  subnet_id  =  aws_subnet.SUUUU_prib.id
  route_table_id  =  aws_route_table.suuu_natgwrt.id
}