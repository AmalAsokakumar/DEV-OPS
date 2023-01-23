resource "aws_instance" "webserver" {
  ami           = "XXXX"
  instance_type = "t2.micro"
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
    ]
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa.pub")
  }
  key_name               = aws_key_pair.web.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}
resource "aws_key_pair" "web" {
  # <<code>>
}


# sample 2 

resource "aws_instance" "webserver" {
  ami           = "XXXX"
  instance_type = "t2.micro"
  provisioner "local-exec" {
        command = "echo Instance ${aws_instance.webserver.public_ip} Created! > /tmp/instance_state.txt"
  }
  provisioner "local-exec" {
        when = destroy
        command = "echo Instance ${aws_instance.webserver.public_ip} Destroyed! > /tmp/instance_state.txt"
  }

}
