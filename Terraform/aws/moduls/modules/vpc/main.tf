resource "aws_vpc" "my-module-vpc"{
    cidr_block = var.vpc_cidr
}
resource "aws_subnet" "public-module-subnet"{
    vpc_id = aws_vpc.my-module-vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_subnet_az
}
resource "aws_subnet" "private-module-subnet"{
    vpc_id = aws_vpc.my-module-vpc.id
    cidr_block = var.private_subnet_cidr
    availability_zone = var.private_subnet_az
}
resource "aws_nat_gateway" "nat"{
    connectivity_type = "private"
    subnet_id = aws_subnet.public-module-subnet.id
}