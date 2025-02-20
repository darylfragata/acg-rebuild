# resource "aws_dynamodb_table" "terraform_state_lock" {
#   name     = "dev_terraform_state_lock"
#   hash_key = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
#   billing_mode = "PAY_PER_REQUEST"
#   tags = {
#     Name = "dev_remote_state_db"
#   }
# }