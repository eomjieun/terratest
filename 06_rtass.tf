resource "aws_route_table_association" "suuu_rtas_a" {
  subnet_id  =  aws_subnet.SUUUU_puba.id
  route_table_id  =  aws_route_table.suuu_rt.id
}

resource "aws_route_table_association" "suuu_rtas_c" {
  subnet_id = aws_subnet.SUUUU_pubb.id
  route_table_id  =  aws_route_table.suuu_rt.id
}