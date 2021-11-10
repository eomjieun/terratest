resource  "aws_vpc" "jieun_vpc" {
    cidr_block  = "10.0.0.0/16"
    tags = {
      "Name" = "jieun-vpc"
    }
}