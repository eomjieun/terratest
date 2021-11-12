# 10.0.0.0/16 VPC 전용 인터넷게이트웨이
resource "aws_internet_gateway" "suuu_ig" {
    vpc_id  =  aws_vpc.SUUUU.id

    tags = {
        "Name"  =  "suuu-ig"
    } 
}