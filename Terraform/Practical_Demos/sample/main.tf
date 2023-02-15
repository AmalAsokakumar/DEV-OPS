# terraform settings block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.21" # optional but recommented in production
    }
  }
}
# provider block
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
# resource block
resource "aws_instance" "ec2_demo" {
  ami           = "ami-007868005aea67c54"
  instance_type = "t2.micro"
}