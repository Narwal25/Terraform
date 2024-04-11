provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "example" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  subnet_id = var.subnet_id_value
  key_name = "aws-cli"
  security_groups = [aws_security_group.webSg.id]

    connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/aws-cli.pem")
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [ 
        "wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg",
        "echo 'deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main' | sudo tee /etc/apt/sources.list.d/hashicorp.list", 
    ]
  }
}