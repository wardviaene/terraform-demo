# security groups
resource "aws_security_group" "rds-app-prod" {
  vpc_id = "${aws_vpc.main.id}"
  name = "rds-app-prod"
  description = "Allow inbound mysql traffic"
  tags {
    Name = "rds-app-prod"
  }
}
resource "aws_security_group_rule" "allow-mysql" {
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.rds-app-prod.id}"
    source_security_group_id = "${aws_security_group.app-prod.id}"
}
resource "aws_security_group_rule" "allow-outgoing" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    security_group_id = "${aws_security_group.rds-app-prod.id}"
    cidr_blocks = ["0.0.0.0/0"]
}
# rds
resource "aws_db_instance" "rds-app-prod" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.6.29"
  instance_class       = "db.t2.micro"
  identifier           = "app-prod"
  name                 = "mydb"
  username             = "root"
  password             = "MYSQLROOTPASSHERE"
  db_subnet_group_name = "${aws_db_subnet_group.rds-app-prod.name}"
  parameter_group_name = "default.mysql5.6"
  multi_az             = "false"
  vpc_security_group_ids = ["${aws_security_group.rds-app-prod.id}"]
  storage_type         = "gp2"
  backup_retention_period = 30
  tags {
      Name = "rds-appprod"
  }
}

resource "aws_db_subnet_group" "rds-app-prod" {
    name = "rds-app-prod"
    description = "RDS subnet group"
    subnet_ids = ["${aws_subnet.main-private-1.id}", "${aws_subnet.main-private-2.id}"]
}
