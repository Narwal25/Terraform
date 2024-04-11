provider "aws" {
  region = "ap-south-1"
}

module "myVpc" {
  source = "../modules/vpc"
  ami_value = var.ami_value
  instance_type_value = var.instance_type_value
}