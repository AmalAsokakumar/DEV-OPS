resource "aws_instance" "webserver" {
  ami                    = "ami-00d8a762cb0c50254"
  instance_type          = "t2.micro"
  tags = {
    Name        = "Webserver"
    Description = "An Nginx Webserver on Ubuntu"
  }
  user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                systemctl enable nginx 
                systemctl start nginx 
                EOF
  key_name               = aws_key_pair.web.id
  vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

resource "aws_key_pair" "web" {
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow ssh access form internet"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "public-ip"{
    value = aws_instance.webserver.public_ip
}
