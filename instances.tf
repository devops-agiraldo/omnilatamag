resource "aws_instance" "instance1" {
	availability_zone = "${data.aws_availability_zones.az.names[0]}"
	ami = "${var.ami_id}"
	associate_public_ip_address = true
	instance_type = "${var.instance_type}"
	vpc_security_group_ids = ["${aws_security_group.ssh-sg.id}"]
	subnet_id = "${aws_subnet.public_subnet1.id}"
	key_name      = aws_key_pair.generated_key1.key_name
	tags = {
	 Name = "demo-omniLatam-us-east-1a"
	}
}
resource "aws_instance" "instance2" {
    availability_zone = "${data.aws_availability_zones.az.names[1]}"
    ami = "${var.ami_id}"
    associate_public_ip_address = true
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = ["${aws_security_group.ssh-sg.id}","${aws_security_group.webserver-sg.id}"]
    subnet_id = "${aws_subnet.public_subnet2.id}"
    key_name      = aws_key_pair.generated_key2.key_name
    tags = {
	    Name = "demo-omniLatam-us-east-1b"
    }
}
resource "aws_instance" "instance3" {
	availability_zone = "${data.aws_availability_zones.az.names[2]}"
	ami = "${var.ami_id}"
	associate_public_ip_address = true
	instance_type = "${var.instance_type}"
	vpc_security_group_ids = ["${aws_security_group.ssh-sg.id}","${aws_security_group.allow_tls-sg.id}"]
	subnet_id = "${aws_subnet.private_subnet.id}"
	key_name      = aws_key_pair.generated_key3.key_name
	tags = {
		Name = "demo-omniLatam-us-east-1c"
	}
}
