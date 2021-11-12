resource  "aws_vpc" "SUUUU" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "suuu-vpc"
  }
}