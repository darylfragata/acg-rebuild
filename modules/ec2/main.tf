resource "aws_instance" "compute" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  key_name                    = var.module_key_pair
  iam_instance_profile        = var.iam_instance_profile
  #associate_public_ip_address = var.associate_public_ip

  tags = var.tags

  depends_on = [ var.module_key_pair ]
}
