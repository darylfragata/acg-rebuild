module "ansible_server_01" {
  source        = "../../../modules/ec2"
  ami           = var.byol_ami
  instance_type = var.instance_type
  subnet_id     = data.terraform_remote_state.vpc.outputs.public_subnet_ids["public_management"]
  #subnet_id            = data.terraform_remote_state.vpc.outputs.public_subnet_ids["public_management"] ### if using s3 bucket as backend
  security_group_ids   = [data.terraform_remote_state.security_groups.outputs.ansible_sg_id]
  iam_instance_profile = data.terraform_remote_state.iam.outputs.ansible_role_name

  module_key_pair = var.key_pair

  tags = {
    Environment = "dev"
    Name        = "ansible_server_1"
  }
}
