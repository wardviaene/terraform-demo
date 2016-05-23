# test instance that'll launch in the same vpc
#resource "aws_instance" "test-instance" {
#    ami = "ami-b0ac25c3"
#    instance_type = "t2.micro"
#    vpc_security_group_ids = ["${aws_security_group.app-prod.id}"]
#    subnet_id = "${aws_subnet.main-public-1.id}"
#    key_name = "${aws_key_pair.app.key_name}"
#    tags {
#        Name = "temp instance"
#    }
#}
