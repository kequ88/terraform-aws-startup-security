resource "aws_iam_user_group_membership" "developers" {
  for_each = toset(var.dev_users)

  user = each.value
  groups = [aws_iam_group.developers.name]
}

resource "aws_iam_user_group_membership" "admins" {
  for_each = toset(var.admin_users)

  user = each.value
  groups = [aws_iam_group.admins.name]
}

resource "aws_iam_user_group_membership" "qa" {
  for_each = toset(var.qa_users)

  user = each.value
  groups = [aws_iam_group.qa.name]
}

resource "aws_iam_user_group_membership" "ops" {
  for_each = toset(var.ops_users)

  user = each.value
  groups = [aws_iam_group.ops.name]
}


# Admin Group -> Admin Policy
resource "aws_iam_group_policy_attachment" "admin_policy_attach" {
  group      = aws_iam_group.admins.name
  policy_arn = aws_iam_policy.admin_policy.arn
}

# Developers Group -> Developer Policy
resource "aws_iam_group_policy_attachment" "developer_policy_attach" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.developer_policy.arn
}

# QA Group -> QA Policy
resource "aws_iam_group_policy_attachment" "qa_policy_attach" {
  group      = aws_iam_group.qa.name
  policy_arn = aws_iam_policy.qa_policy.arn
}

# Ops Group -> Ops Policy
resource "aws_iam_group_policy_attachment" "ops_policy_attach" {
  group      = aws_iam_group.ops.name
  policy_arn = aws_iam_policy.ops_policy.arn
}

resource "aws_iam_group_policy_attachment" "billing_admins" {
  group      = aws_iam_group.admins.name
  policy_arn = aws_iam_policy.billing_access.arn
}

