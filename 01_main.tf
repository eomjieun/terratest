provider   "aws" {
    region = var.region
}

resource "aws_key_pair" "suuu" {
  key_name   = var.key
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDD/FtiM8H3rtobWCVLeQi18FDJnaFkJunFANreCNoD00sElw19A5rQiHIVUdHPkae+OjAimdRh1Es36SSdE56sAgnkh4ggKq0IyXTj6Yp5sP5CZggvr0GgVOOYUU+PsgYd0QqTG+1RI9UGW1FRKX5oT7O07w60dvmi+N5kDDiCEBGiBN722GG/f0g6xJSuODqC4lRv+iabHMQvqmxdRb6uEbixMPcTOw3CA/LFaEcGNq8Mhi4+t2cBsw1qWKuQiPa3zSrquQG38V6cxLAle5fl/ji868UfW4hXfReOMaF5oHP3tGwCjUrXzbNflOQFaOZKGL5cEWPAmqDMYJjh4rF5nT82Bs1I5wqxFi+VgxYJKS1zRETGysZ7lnIWs9fCDoyaImXWUeqL/7O6G3/dvFsk3JMYWwnH/A//2U4gmqnx4S5MPuz1WUFneK3enGT/fKWSiRjohS2ZrefavuqpCoxaI1ph6Ri3m9MZaxPK2XOQCPuYz0t6nWB49y9xp4j1tlk="
  #public_key = file("../../../.ssh/suuu_key.pub")
}

resource  "aws_vpc" "SUUUU" {
  cidr_block = var.cidr_main
  tags = {
    "Name" = "${var.name}-vpc"
  }
}

# 가용영역의 public subnet
resource "aws_subnet" "SUUUU_pub" {
  count = length(var.cidr_public)  #2
  vpc_id  = aws_vpc.SUUUU.id
  cidr_block = var.cidr_public[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
      "Name" = "${var.name}-pub${var.ava[count.index]}"
  }
}

# 가용영역의 private subnet
resource "aws_subnet" "SUUUU_pri" {
  count = length(var.cidr_private)
  vpc_id  = aws_vpc.SUUUU.id
  cidr_block = var.cidr_private[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
      "Name" = "suuu_pria"
  }
}


  # 가용영역 private DB Subnet
resource "aws_subnet" "SUUUU_pridb" {
    count = length(var.cidr_privatedb)
  vpc_id  = aws_vpc.SUUUU.id
  cidr_block = var.cidr_privatedb[count.index]
  availability_zone =  "${var.region}${var.ava[count.index]}"
  tags = {
  "Name" = "${var.name}_pridb${var.ava[count.index]}"
  }
}
