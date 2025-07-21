# iam/groups.tf
resource "aws_iam_group" "admins" {
  name = "Admins"
}

resource "aws_iam_group" "developers" {
  name = "Developers"
}

resource "aws_iam_group" "qa" {
  name = "QA"
}

resource "aws_iam_group" "ops" {
  name = "Ops"
}
