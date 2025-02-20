resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "my_new_key_pair" {
  key_name   = "acg-key"
  public_key = tls_private_key.example.public_key_openssh
}

# Output private key to a file on the local machine
resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${path.module}/acg-key.pem"
}