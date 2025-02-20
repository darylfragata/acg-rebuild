variable "dev_region" {
  description = "Provider region"
  default     = "us-east-1"
}

variable "dev_profile" {
  description = "aws account profile"
  default     = "acg"
}

variable "byol_ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_pair" {
  description = "SSH key name"
  type        = string
}
