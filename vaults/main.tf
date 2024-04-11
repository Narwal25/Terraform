provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://13.232.4.156:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "b7653a93-5077-a3d8-bbe7-dd92e4489e4c"
      secret_id = "a4cf3d74-dc9e-1063-7971-aa4366e4793c"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}