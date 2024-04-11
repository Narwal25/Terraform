resource "aws_key_pair" "mykey" {
  key_name = "terraform-demo-narwal"
  public_key = file("~/.ssh/id_rsa.pub")
}

