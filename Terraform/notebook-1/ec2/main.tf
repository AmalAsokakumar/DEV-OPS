provider "aws" {
  region = var.avail_zone
}
# create a vpc.
resource "aws_vpc" "demo-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}
# create a subnet for the vpc.
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.subnet_cidr_blocks[0].cidr_block
  availability_zone = var.subnet_cidr_blocks[0].az
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env_prefix}-${var.subnet_cidr_blocks[0].name}-subnet"
  }
}
# creating a private subnet
resource "aws_subnet" "private-subnet"{
  vpc_id = aws_vpc.demo-vpc.id
  cidr_block = var.subnet_cidr_blocks[1].cidr_block
  availability_zone = var.subnet_cidr_blocks[1].az
   map_public_ip_on_launch = false
  tags = {
    Name = "${var.env_prefix}-${var.subnet_cidr_blocks[1].name}-subnet"
  }
}
# here we are creating a route table for allowing internal communication routes and route to internet gate way for external access.
resource "aws_route_table" "demo-route-table" {
  vpc_id = aws_vpc.demo-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-internet-gateway.id
  }
  tags = {
    Name = "${var.env_prefix}-route-table"
  }
}
# creating an internet gateway to allow external or internet access to the vpc.
resource "aws_internet_gateway" "demo-internet-gateway" {
  vpc_id = aws_vpc.demo-vpc.id
}
#associating route table with the subnet.
resource "aws_route_table_association" "demo-route-table-association-with-subnet" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.demo-route-table.id
}
# configure the security group
resource "aws_security_group" "security-group" {
  vpc_id = aws_vpc.demo-vpc.id
  name = "${var.env_prefix}-my-security-group"
  # ingress for incomming 
  ingress {
    from_port   = 22 # to open a range of ports, here we are opening only one port.
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my-ip]
  }
  ingress {
    from_port   = 80 # to open a range of ports, here we are opening only one port.
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # anyone can access this website 
  }
  # egress for exiting traffic
  egress {                 # outgoing traffic rules, install something on the server, packages, dokcer images need to be fetched form outside the internet.
    from_port       = 0    # any port
    to_port         = 0    # any port
    protocol        = "-1" # any protocol
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    Name = "${var.env_prefix}-my-sg"
  }
}
# default security group
resource "aws_default_security_group" "my-sg" {
  vpc_id = aws_vpc.demo-vpc.id
  # ingress for incomming 
  ingress {
    from_port   = 22 # to open a range of ports, here we are opening only one port.
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my-ip]
  }
  ingress {
    from_port   = 80 # to open a range of ports, here we are opening only one port.
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # anyone can access this website 
  }
  # egress for exiting traffic
  egress {                 # outgoing traffic rules, install something on the server, packages, dokcer images need to be fetched form outside the internet.
    from_port       = 0    # any port
    to_port         = 0    # any port
    protocol        = "-1" # any protocol
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    Name = "${var.env_prefix}-my-default-sg"
  }
}
# creating ec2 instance
# getting the latest aws ami from the list of available amis
data "aws_ami" "latest-amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
resource "aws_instance" "my-app-ec2" {
  ami                         = data.aws_ami.latest-amazon-linux-image.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.security-group.id, ]
  availability_zone           = "us-east-1a"
  associate_public_ip_address = true
  key_name                    = "terraform"
  tags = {
    Name = "Dev Server"
  }
}
