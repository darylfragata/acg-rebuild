# provider "aws" {
#   region  = var.dev_region
#   profile = var.dev_profile
# }

# variable "dev_region" {
#   description = "Provider region"
#   default     = "us-east-1"
# }

# variable "dev_profile" {
#   description = "aws account profile"
#   default     = "acg"
# }

# module "tfstatefile_bucket" {
#   source      = "../../../../modules/s3"
#   bucket_name = "dev-tfstatefile-021925"

#   tags = {
#     Name = "terraform_state_bucket"
#   }
# }