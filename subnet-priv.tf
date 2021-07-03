resource "aws_subnet" "private_subnet" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = var.pri1_cidr
  availability_zone       = data.aws_availability_zones.az.names[2]
  map_public_ip_on_launch = false
  tags = {
   Name        = "private-subnet"
  }
}
