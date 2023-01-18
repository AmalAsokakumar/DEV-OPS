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
resource "aws_subnet" "demo-subnet" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.subnet_cidr_blocks[0]
  availability_zone = var.subnet_cidr_blocks[1]
  tags = {
    Name = "${var.env_prefix}-subnet"
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
  subnet_id      = aws_subnet.demo-subnet.id
  route_table_id = aws_route_table.demo-route-table.id
}


# using the default route table.


# resource "aws_default_route_table" "main-route-table" {
#     default_route_table_id = aws_vpc.demo-vpc.default_route_table_id
#     route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.demo-internet-gateway.id
#   }
#   tags = {
#     Name = "${var.env_prefix}-default-route-table"
#   }
# }

# resource "aws_route_table_association" "default-route-table-association-with-subnet"{
#     subnet_id = aws_subnet.demo-subnet.id
#     route_table_id = aws_default_route_table.main-route-table.id
# }


# configure the security group
resource "aws_security_group" "my-SG" {
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
    Name = "${var.env_prefix}-my-SG"
  }
}




# default security group

resource "aws_default_security_group" "my-SG" {
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
    Name = "${var.env_prefix}-my-default-SG"
  }
}