# Vpc

## here's another example of using
-  Terraform modules:

Let's say we are creating a VPC infrastructure on AWS, and we want to create a module that creates a VPC with public and private subnets, and a NAT gateway. The module is called "vpc" and is located in a directory called "modules/vpc".

The main.tf file in the "vpc" module contains the resources for creating the VPC, public subnets, private subnets, and NAT gateway:

```
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.public_subnet_az
}


resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_subnet_az
}

resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.public.id
}
```
The variables.tf file defines the variables that can be passed to the module:

```
variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "public_subnet_az" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "private_subnet_az" {
  type = string
}
```
The outputs.tf file defines the outputs that can be returned from the module:

```
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [aws_subnet.public.id]
}

output "private_subnet_ids" {
  value = [aws_subnet.private.id]
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}
```
In the main Terraform configuration file, we can then call the "vpc" module and pass the required variables to it:
```
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  public_subnet_az = "us-west-2a"
  private_subnet_cidr = "10.0.2.0/24"
  private_subnet_az = "us-west-2b"
}
```
When we run terraform apply, Terraform will create the VPC, public and private subnets, and NAT gateway using the resources defined in the "vpc" module and with the variables
