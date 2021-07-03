resource "aws_security_group" "ssh-sg" {
  name        = "ssh_access"
  description = "Secutiry Group for ssh access from my site"
  vpc_id      = "${aws_vpc.vpc.id}"
  ingress {
   from_port = "22"
   to_port   = "22"
   protocol  = "tcp"
   cidr_blocks = ["191.88.38.17/32"]
  }
        
  egress {
   from_port = "0"
   to_port   = "0"
   protocol  = "-1"
   self      = "true"
  }
  tags = {
   Name = "allow_ssh"
  }
}

resource "aws_security_group" "webserver-sg" {
  name        = "http_access"
  description = "Secutiry Group for http access"
  vpc_id      = "${aws_vpc.vpc.id}"
  ingress {
   from_port = "80"
   to_port   = "80"
   protocol  = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
  }
        
  egress {
   from_port = "0"
   to_port   = "0"
   protocol  = "-1"
   cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
   Name = "allow_http"
  }
}


resource "aws_security_group" "allow_tls-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
   description      = "TLS from VPC"
   from_port        = 443
   to_port          = 443
   protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
   from_port        = 0
   to_port          = 0
   protocol         = "-1"
   cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
   Name = "allow_tls"
  }
}
