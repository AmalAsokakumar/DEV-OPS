resource "aws_instance" "webserver" {
  ami                    = "ami-0b5eea76982371e91"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.web.id
  network_interface {
    network_interface_id = aws_network_interface.my-nic.id
    device_index         = 0
  }
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
}

resource "aws_key_pair" "web" {
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "Allow ssh access form internet"
  vpc_id      = aws_vpc.my-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my-vpc.cidr_block]
  }
}

output "public_ip" {
  value = aws_instance.webserver.public_ip
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "tf-example-vpc"
  }
}

resource "aws_subnet" "my-subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "tf-example-subnet"
  }
  depends_on = [aws_internet_gateway.my-gw]
}

resource "aws_network_interface" "my-nic" {
  subnet_id  = aws_subnet.my-subnet.id
  security_groups = [aws_security_group.ssh-access.id]
}

resource "aws_internet_gateway" "my-gw" {
  vpc_id = aws_vpc.my-vpc.id
}

# resource "aws_eip" "my-eip" {
#   vpc                       = true
#   instance                  = aws_instance.webserver.id
#   network_interface         = aws_network_interface.my-nic.id
#   associate_with_private_ip = "172.16.10.100"
#   depends_on = [aws_internet_gateway.my-gw]
# }