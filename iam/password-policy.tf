resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 14
  require_symbols                = true
  require_numbers                = true
  require_uppercase_characters  = true
  require_lowercase_characters  = true
  allow_users_to_change_password = true
  hard_expiry                   = false
}
