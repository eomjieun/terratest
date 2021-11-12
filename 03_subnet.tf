# 가용영역 a의 pub subnet
resource "aws_subnet" "SUUUU_puba" {
  vpc_id  = aws_vpc.SUUUU.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
      "Name" = "suuu_puba"
  }
}

# 가용영역 b의 pri subnet
resource "aws_subnet" "SUUUU_pria" {
  vpc_id  = aws_vpc.SUUUU.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2b"
  tags = {
      "Name" = "suuu_pria"
  }
}

# 가용영역 c의 pub subnet
resource "aws_subnet" "SUUUU_pubb" {
  vpc_id  = aws_vpc.SUUUU.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
      "Name" = "suuu_pubb"
  }
}

# 가용영역 d의 pri subnet
resource "aws_subnet" "SUUUU_prib" {
  vpc_id  = aws_vpc.SUUUU.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2d"
  tags = {
      "Name" = "suuu_prib"
  }
}