resource "aws_instance" "server" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  key_name = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id = aws_subnet.sub1.id

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host = self.public_ip
  }

  provisioner "file" {
    source = "app.py"
    destination = "/home/ubuntu/app.py"
  }

  provisioner "remote-exec" {
    inline = [ 
        "echo 'Hello from the remote instance'",
        "sudo apt update -y",
        "sudo apt install -y python3-pip",
        "cd /home/ubuntu",
        "pip3 install flask",
        "python3 app.py &",
    ]
  }
}