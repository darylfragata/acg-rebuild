# terraform {
#   backend "remote" {
#     bucket         = "dev-tfstatefile-021925"
#     key            = "dev/vpc.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "dev_terraform_state_lock"
#   }
# }
