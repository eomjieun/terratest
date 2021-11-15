resource "aws_db_instance" "suuu_rds" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "test"
  identifier = "test"
  username = "admin"
  password = "It12345!"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.suuu_dbsb.id
  vpc_security_group_ids = [aws_security_group.suuu_sg.id]
  skip_final_snapshot = true

  tags = {
    "Name" = "suuu_rds"
  }
}

resource "aws_db_subnet_group" "suuu_dbsb" {
  name = "suuu-dbsb-group"
  subnet_ids = [aws_subnet.SUUUU_pridba.id,aws_subnet.SUUUU_pridbc.id]
  tags = {
    "Name" = "suuu_dbsb-group"
  }
}