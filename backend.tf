terraform {
  backend "s3" {
    bucket = "narwal-terraform-s3-bucket"
    region = "ap-south-1"
    key = "narwal/terraform.tfstate"
    dynamodb_table = "terraform_lock"
  }
}

provider "aws" {
  region = "ap-south-1"
}