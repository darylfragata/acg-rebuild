# Terraform Modules

## Overview

This directory contains reusable Terraform modules that define various infrastructure components. Each module is designed to be environment-agnostic, promoting modularity and reusability.

## Module Structure

```
modules/
├── ec2/              # EC2 instance configurations
├── iam/              # IAM roles and policies
├── s3/               # S3 bucket configurations
├── security_groups/  # Security group configurations
└── vpc/              # VPC and networking
```

## Available Modules

### EC2 Module

**Location:** `modules/ec2/`

- Defines EC2 instances and related resources
- Supports Auto Scaling Groups
- Configurable instance types, AMIs, and networking options

### IAM Module

**Location:** `modules/iam/`

- Manages IAM roles, policies, and permissions
- Supports role-based access control
- Provides reusable IAM policy templates

### S3 Module

**Location:** `modules/s3/`

- Configures S3 buckets for storage and logging
- Supports encryption and versioning
- Manages bucket policies and lifecycle rules

### Security Groups Module

**Location:** `modules/security_groups/`

- Defines security groups for EC2 and other resources
- Supports custom ingress and egress rules
- Provides default and customizable rule sets

### VPC Module

**Location:** `modules/vpc/`

- Creates Virtual Private Cloud (VPC) infrastructure
- Manages subnets, route tables, and gateways
- Supports CIDR block configuration

## Usage

Each module can be included in Terraform configurations from the environment-specific directories (e.g., `environments/dev/vm/` or `environments/qa/vm/`). Example usage within a root module:

```hcl
module "ec2_instance" {
  source        = "../modules/ec2"
  instance_type = "t2.micro"
  ami_id        = "ami-12345678"
  subnet_id     = "subnet-abcdef12"
}
```

## Best Practices

- Keep modules independent and reusable
- Use variables to allow customization
- Follow naming conventions for consistency
- Document input and output variables clearly

## Contributing

1. Create a feature branch for your module updates
2. Follow existing directory structure and naming conventions
3. Test changes before committing
4. Submit a pull request for review

## License

This repository is licensed under [MIT License](LICENSE).

