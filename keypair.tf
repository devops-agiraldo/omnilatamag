resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key1" {
  key_name   = var.key_name1
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
  command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey1.pem"
  }
}

resource "aws_key_pair" "generated_key2" {
  key_name   = var.key_name2
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
  command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey2.pem"
  }
}

resource "aws_key_pair" "generated_key3" {
  key_name   = var.key_name3
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" {
  command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey3.pem"
  }
}