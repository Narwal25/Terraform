resource "aws_s3_bucket" "s3_bucket" {
  bucket = "narwal-terraform-s3-bucket"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform_lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}