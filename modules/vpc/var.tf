variable "cidr" {
  default = "10.0.0.0/16"
}

variable "ami_value" {
  description = "value for the ami"
  default = "ami-007020fd9c84e18c7"
}

variable "instance_type_value" {
  description = "value for the instance_type"
  default = "t2.micro"
}