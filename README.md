# 🚀 Terraform AWS IAM & Security Setup for Startups

This repository manages AWS IAM configuration and security logging for a startup's AWS account using **Terraform**, following best practices.

## 📁 Folder Structure

```
terraform-aws-iam-setup/
├── backend/              # S3 + DynamoDB backend config
│   └── main.tf
├── iam/                  # IAM setup (users, groups, policies)
│   ├── main.tf
│   ├── groups.tf         # IAM groups
│   ├── users.tf          # IAM users
│   ├── policies.tf       # Custom policies
│   ├── attachments.tf    # Attach policies to users/groups
│   ├── variables.tf      # Variables
│   ├── outputs.tf        # Outputs
│   └── terraform.tfvars  # Values for variables
├── .gitignore
└── README.md
```

## ✅ Features

- 🔐 Secure IAM group setup:
  - Admins, Finance, Tech Lead, Developers
  - Least-privilege principle
- 📦 S3 backend & DynamoDB locking for safe state management
- ♻️ Modular and reusable Terraform code

## 🛠️ How to Use

### 1. Initialize Backend

Edit your backend config in `backend/main.tf`, then initialize:

```bash
cd backend
terraform init
```

### 2. Deploy IAM Resources

```bash
cd ../iam
terraform init
terraform plan
terraform apply
```

---

Maintained by [Your Name].