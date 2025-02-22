# terraform {
#   backend "s3" {
#     bucket         = "dev-tfstatefile-021925"
#     key            = "dev/sg.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "dev_terraform_state_lock"
#   }
# }
