provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-kenchenquah-20250721"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
