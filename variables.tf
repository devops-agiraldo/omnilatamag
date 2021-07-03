variable "cidr" {
  type = string
  default = "10.0.0.0/16"
}
variable "ami_id" {
  type = string
  default = "ami-0ab4d1e9cf9a1215a"
}
variable "instance_type" {
 type = string
 default = "t2.micro"
}

variable "pub1_cidr" {
  type = string
  default = "10.0.0.0/24"
}

variable "pub2_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "pri1_cidr" {
  type = string
  default = "10.0.10.0/24"
}

variable "key_name1" {
  type = string
  default = "kp1.pem"
}

variable "key_name2" {
  type = string
  default = "kp2.pem"
}

variable "key_name3" {
  type = string
  default = "kp3.pem"
}