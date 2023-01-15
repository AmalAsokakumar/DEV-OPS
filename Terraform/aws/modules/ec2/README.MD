### Here's an example of a Terraform module for creating an EC2 instance with all its dependencies:

Let's say we have a module called "ec2_instance" that creates an EC2 instance with an associated Elastic IP, security group, and IAM role. The module is located in a directory called "modules/ec2_instance" and has the following structure:

```
modules/ec2_instance
    main.tf
    variables.tf
    outputs.tf
```
The main.tf file contains the Terraform resources for creating the EC2 instance, Elastic IP, security group, and IAM role:

```
resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.sg.id]
  iam_instance_profile = aws_iam_instance_profile.profile.name
  ...
}

resource "aws_eip" "eip" {
  vpc = true
  ...
}

resource "aws_security_group" "sg" {
  name        = "example"
 ```