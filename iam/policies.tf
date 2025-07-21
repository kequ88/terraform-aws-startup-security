# iam/policies.tf

# Admin Policy Document
data "aws_iam_policy_document" "admin" {
  statement {
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "admin_policy" {
  name        = "AdminAccessPolicy"
  description = "Full access to all AWS resources"
  policy      = data.aws_iam_policy_document.admin.json
}

# Developer Policy Document
data "aws_iam_policy_document" "developer" {
  statement {
    actions = [
      "ec2:Describe*",
      "s3:Get*",
      "s3:List*",
      "dynamodb:Query",
      "dynamodb:GetItem",
      "logs:*",
      "cloudwatch:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "developer_policy" {
  name        = "DeveloperAccessPolicy"
  description = "Read-only access for development and monitoring"
  policy      = data.aws_iam_policy_document.developer.json
}

# QA Policy Document
data "aws_iam_policy_document" "qa" {
  statement {
    actions = [
      "s3:Get*",
      "s3:List*",
      "dynamodb:Scan",
      "logs:GetLogEvents",
      "cloudwatch:GetMetricData"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "qa_policy" {
  name        = "QAAccessPolicy"
  description = "Limited access for QA testing and validation"
  policy      = data.aws_iam_policy_document.qa.json
}

# Ops Policy Document
data "aws_iam_policy_document" "ops" {
  statement {
    actions = [
      "ec2:Describe*",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "cloudwatch:Describe*",
      "cloudwatch:Get*",
      "cloudwatch:List*",
      "logs:Describe*",
      "logs:Get*",
      "logs:List*",
      "ssm:Describe*",
      "ssm:Get*",
      "ssm:List*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ops_policy" {
  name        = "OpsSupportPolicy"
  description = "Access to EC2, CloudWatch, Logs, and SSM for operations team"
  policy      = data.aws_iam_policy_document.ops.json
}

resource "aws_iam_policy" "billing_access" {
  name        = "BillingAccessPolicy"
  description = "Allow admins to access billing and cost management"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "aws-portal:*Billing",
          "aws-portal:ViewBilling",
          "aws-portal:ViewUsage",
          "aws-portal:ViewAccount",
          "budgets:ViewBudget",
          "cur:*",
          "ce:*"
        ],
        Resource = "*"
      }
    ]
  })
}
