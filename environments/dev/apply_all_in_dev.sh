#!/bin/bash

set -e  # Exit on error

# Deploy VPC
cd vpc
terraform fmt
terraform init
terraform plan
echo -e "Deploying VPC\n"
terraform apply -auto-approve
cd ..

# Deploy SG
cd security_groups
terraform fmt
terraform init
terraform plan
echo -e "Deploying security groups\n"
terraform apply -auto-approve
cd ..

# Deploy IAM
cd iam
terraform fmt
terraform init
terraform plan
echo -e "IAM\n"
terraform apply -auto-approve
cd ..

# Deploy VM
cd vm
terraform fmt
terraform init
terraform plan
echo -e "Deploying VM\n"
terraform apply -auto-approve
cd ..

echo -e "\n\nCOMPLETED\n\n"