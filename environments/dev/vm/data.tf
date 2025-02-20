data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../vpc/terraform.tfstate"
  }
}

# data "terraform_remote_state" "vpc" { ### if using s3 bucket as backend
#   backend = "s3"

#   config = {
#     bucket         = "dev-tfstatefile-021925"
#     key            = "dev/vpc.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "dev_terraform_state_lock"
#   }
# }

data "terraform_remote_state" "security_groups" {
  backend = "local"

  config = {
    path = "../security_groups/terraform.tfstate"
  }
}

data "terraform_remote_state" "iam" {
  backend = "local"

  config = {
    path = "../iam/terraform.tfstate"
  }
}