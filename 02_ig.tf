# 10.0.0.0/16 VPC 전용 인터넷게이트웨이
resource "aws_internet_gateway" "suuu_ig" {
    vpc_id  =  aws_vpc.SUUUU.id

    tags = {
        "Name"  =  "${var.name}-ig"
    } 
}

resource "aws_route_table" "suuu_rt" {
  vpc_id  =  aws_vpc.SUUUU.id

  route  {
      cidr_block = var.cidr_route
      gateway_id = aws_internet_gateway.suuu_ig.id
    }  
    tags = {
        "Name" = "${var.name}_rt"
    }
}

resource "aws_route_table_association" "suuu_rtas_a" {
  count = length(var.cidr_public)
  subnet_id  =  aws_subnet.SUUUU_pub[count.index].id
  route_table_id  =  aws_route_table.suuu_rt.id
}

