resource "aws_security_group" "suuu_sg" {
  name  =  "Allow Basic"
  description =  "Allow http,ssh,sql,icmp"
  vpc_id  =  aws_vpc.SUUUU.id

  ingress = [
    {
      description  =  var.protocol_http
      from_port  = var.port_http
      to_port  =  var.port_http
      protocol  =  var.protocol_tcp
      cidr_blocks  =  [var.cidr]
      ipv6_cidr_blocks  =  [var.cidr_v6]
      prefix_list_ids  =  null
      security_groups  =  null
      self             =  null
    },
    {
      description  =  var.protocol_ssh
      from_port  = var.port_ssh
      to_port  =  var.port_ssh
      protocol  =  var.protocol_tcp
      cidr_blocks  =  [var.cidr]
      ipv6_cidr_blocks  =  [var.cidr_v6]
      prefix_list_ids  =  null
      security_groups  =  null
      self             =  null
    },
    {
      description  =  var.db_name
      from_port  = var.port_mysql
      to_port  =   var.port_mysql
      protocol  =  var.protocol_tcp
      cidr_blocks  =  [var.cidr]
      ipv6_cidr_blocks  =  [var.cidr_v6]
      prefix_list_ids  =  null
      security_groups  =  null
      self             =  null
    },
    {
      description  =  var.protocol_icmp
      from_port  = var.port_zero
      to_port  =  var.port_zero
      protocol  =  var.protocol_icmp
      cidr_blocks  =  [var.cidr]
      ipv6_cidr_blocks  =  [var.cidr_v6]
      prefix_list_ids  =  null
      security_groups  =  null
      self             =  null
    }
  ]

  egress  =  [
    {
      description  =  "ALL"
      from_port  =  var.port_zero
      to_port  =  var.port_zero
      protocol  =  var.protocol_minus
      cidr_blocks  =  [var.cidr]
      ipv6_cidr_blocks  =  [var.cidr_v6]
      prefix_list_ids  =  null
      security_groups  =  null
      self             =  null
    }
  ]
  tags  =  {
    "Name"  =  "${var.name}_sg"
  }
}

resource "aws_instance" "suuu_web" {
  ami                    = "ami-0a5a6128e65676ebb"
  instance_type          = var.instance
  key_name               = var.key #00_key 첫 줄이 아니고 key_name이 와야함!!!
  availability_zone      = var.region_instance
  private_ip             = var.private_ip 
  subnet_id              = aws_subnet.SUUUU_pub[0].id
  vpc_security_group_ids = [aws_security_group.suuu_sg.id]
  user_data              = file("./intall.sh")
  tags = {
    "Name" = "${var.name}_web"
  }
}

resource "aws_eip" "suuu_web_ip" {
  vpc                       = true
  instance                  = aws_instance.suuu_web.id
  associate_with_private_ip = var.private_ip
  depends_on = [
    aws_internet_gateway.suuu_ig
  ]
}

output "public_ip" {
  value = aws_instance.suuu_web.public_ip
}
