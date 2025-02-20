#This is for A Cloud Guru AWS Infra rebuild once access is expired.

# Multi-Account AWS Structure Infrastructure as Code

## Overview
This repository automates the rebuild of AWS cloud resources, particularly in ACG, where resources expire after 4 or 8 hours. It follows a modular approach with environment-specific configurations and reusable modules to manage a multi-account AWS infrastructure setup.

## Repository Structure

```
├── environments/          # Environment-specific configurations
│   ├── dev              # Development environment
│   │   ├── iam          # IAM roles and policies
│   │   ├── s3           # S3 bucket configurations
│   │   │   ├── tfstatefile-bucket  # State file storage
│   │   ├── security_groups  # Security groups
│   │   ├── vm           # Virtual machines (EC2 instances)
│   │   ├── vpc          # VPC and networking
│   │   ├── apply_all_in_dev.sh  # Script to apply all Terraform configurations in dev
│   │   ├── destroy_all_in_dev.sh  # Script to destroy all resources in dev
│   ├── qa               # QA environment (similar to dev)
│
└── modules/             # Reusable Terraform modules
    ├── ec2/            # EC2 instance configurations
    ├── iam/            # IAM roles and policies
    ├── s3/             # S3 bucket configurations
    ├── security_groups/ # Security group configurations
    └── vpc/            # VPC and networking
```

## AWS Account Structure
The infrastructure is distributed across multiple AWS accounts for better security and resource isolation:

- **Development Account**: Development environment resources
- **QA Account**: Quality Assurance environment resources

## Modules

### VPC Module
Located in `modules/vpc/`
- Manages VPC configurations
- Handles subnet layouts
- Defines network connectivity and routing

### EC2 Module
Located in `modules/ec2/`
- Manages EC2 instances
- Handles Auto Scaling Groups
- Other compute-related resources

### IAM Module
Located in `modules/iam/`
- IAM roles and policies
- Access control configurations

### Security Groups Module
Located in `modules/security_groups/`
- Defines security groups
- Manages network access policies

### S3 Module
Located in `modules/s3/`
- Logging bucket configurations
- Backup storage setups
- General S3 bucket management

## Environment-Specific Configurations
Each environment (`dev`, `qa`) contains:
- `main.tf`: Main configuration file that calls required modules
- `variables.tf`: Environment-specific variable definitions
- `terraform.tfvars`: Variable values for the environment
- `backend.tf`: Remote state configuration

### Directory Structure (Example: Dev Environment)
```
dev/
├── iam/                 # IAM role definitions
├── s3/                  # S3 bucket configurations
├── security_groups/      # Security groups
├── vm/                  # EC2 instances
├── vpc/                 # VPC configurations
├── apply_all_in_dev.sh   # Apply script
├── destroy_all_in_dev.sh # Destroy script
```

## Prerequisites

1. AWS CLI configured with appropriate credentials
2. Terraform (`>=1.x` recommended)
3. Appropriate AWS account access and permissions
4. S3 bucket for Terraform state storage
5. DynamoDB table for state locking

## Usage

1. Navigate to the desired environment directory:
   ```sh
   cd environments/dev
   ```

2. Initialize Terraform:
   ```sh
   terraform init
   ```

3. Review the planned changes:
   ```sh
   terraform plan
   ```

4. Apply the changes:
   ```sh
   terraform apply
   ```

Alternatively, use the provided script to apply all configurations in the `dev` environment:

```sh
./apply_all_in_dev.sh
```

### Destroying an Environment
To tear down resources in an environment:

```sh
terraform destroy
```

Alternatively, use the provided script:

```sh
./destroy_all_in_dev.sh
```

## Best Practices
1. Always use remote state storage.
2. Use workspace-specific variables.
3. Follow the principle of least privilege for IAM roles.
4. Tag all resources appropriately.
5. Review plans before applying changes.
6. Use consistent naming conventions.

## State Management
Each environment maintains its state file in a dedicated S3 bucket with the following features:
- Versioning enabled
- Encryption enabled
- State locking via DynamoDB

## Contributing

1. Create a new branch for your changes.
2. Follow the existing code structure.
3. Update documentation as needed.
4. Test changes in the dev environment first.
5. Submit a pull request for review.

## Security Notes
- All sensitive values should be stored in AWS Secrets Manager or SSM Parameter Store.
- Regular security audits should be performed.
- Follow AWS Well-Architected Framework guidelines.

## License
This repository is licensed under [MIT License](LICENSE).

