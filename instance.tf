resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.keypair.key_name
  user_data = file("user-data.txt")

  vpc_security_group_ids = [ aws_security_group.ssh_ping_anywhere_terraform.id, aws_security_group.http_anywhere_terraform.id ]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common",
      "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-get update",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io",
      "sudo docker run hello-world"
    ]

    provisioner "file" {
      source = ""
      destination = ""
    }

    connection {
      user = "ubuntu"
      private_key = file("carlos-key")
      host = self.public_ip
    }
  }

  tags = {
    Name = "${var.project_name}-instance"
  }
}