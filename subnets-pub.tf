resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub1_cidr
  availability_zone       = data.aws_availability_zones.az.names[0]
  map_public_ip_on_launch = true
  tags = {
   Name        = "public-subnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.pub2_cidr
  availability_zone       = data.aws_availability_zones.az.names[1]
  map_public_ip_on_launch = true
  tags = {
   Name        = "public-subnet2"
  }
}