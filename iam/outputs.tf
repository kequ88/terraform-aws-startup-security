# iam/outputs.tf
output "admin_group_name" {
  value = aws_iam_group.admins.name
}
