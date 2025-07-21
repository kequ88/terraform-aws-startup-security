# Terraform AWS IAM Setup

This repository manages the IAM configuration for a startup's AWS account using Terraform following best practices.

## Folder Structure

terraform-aws-iam-setup/
├── backend/              ← S3 + DynamoDB backend config
    └── main.tf
├── iam/                  ← IAM setup (users, groups, policies)
    ├── main.tf
    ├── groups.tf        # IAM groups
    ├── users.tf         # IAM users
    ├── policies.tf      # Custom policies
    ├── attachments.tf   # Attach policies to users/groups
    ├── variables.tf     # Variables
    ├── outputs.tf       # Outputs
    └── terraform.tfvars # Values for variables
├── .gitignore
└── README.md

terraform-aws-iam-setup/
└── iam/
    ├── main.tf          # AWS provider config and backend (optional)
    ├── groups.tf        # IAM groups
    ├── users.tf         # IAM users
    ├── policies.tf      # Custom policies
    ├── attachments.tf   # Attach policies to users/groups
    ├── variables.tf     # Variables
    ├── outputs.tf       # Outputs
    └── terraform.tfvars # Values for variables


## What it Covers

- S3 backend and DynamoDB for state management
- IAM setup:
  - Admin, Finance, Tech Lead, Developers
  - Group policies using Terraform modules
  - Follow least privilege principle

## Usage

### 1. Initialize Backend
Edit `backend/main.tf` with your S3 bucket and DynamoDB table, then run:

```bash
cd backend
terraform init
```

### 2. Deploy IAM
```bash
cd ../iam
terraform init
terraform plan
terraform apply
```