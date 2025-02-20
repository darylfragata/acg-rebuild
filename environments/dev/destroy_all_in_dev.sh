#!/bin/bash

set -e  # Exit on error

# Destroy VM
cd vm
terraform init
echo -e "Destroying VM...\n"

if terraform destroy -auto-approve; then
    echo -e "\nTerraform destroy completed successfully. Cleaning up..."
    rm -rf .terraform* *.pem *.hcl *.tfstate *.backup
else
    echo -e "\nTerraform destroy failed. Skipping cleanup."
fi
cd ..

# Destroy IAM
cd iam
terraform init
echo -e "Destroying IAM...\n"

if terraform destroy -auto-approve; then
    echo -e "\nTerraform destroy completed successfully. Cleaning up..."
    rm -rf .terraform* *.pem *.hcl *.tfstate *.backup
else
    echo -e "\nTerraform destroy failed. Skipping cleanup."
fi
cd ..

# Destroy SG
cd security_groups
terraform init
echo -e "Destroying SG...\n"

if terraform destroy -auto-approve; then
    echo -e "\nTerraform destroy completed successfully. Cleaning up..."
    rm -rf .terraform* *.pem *.hcl *.tfstate *.backup
else
    echo -e "\nTerraform destroy failed. Skipping cleanup."
fi
cd ..

# Destroy VPC
cd vpc
terraform init
echo -e "Destroying VPC...\n"

if terraform destroy -auto-approve; then
    echo -e "\nTerraform destroy completed successfully. Cleaning up..."
    rm -rf .terraform* *.pem *.hcl *.tfstate *.backup
else
    echo -e "\nTerraform destroy failed. Skipping cleanup."
fi
cd ..


echo -e "\nCOMPLETED\n"
