# Here is an example Terraform script that creates an EC2 instance in a VPC, subnet, NAT, security group, and with a routable IP address:


```provider "aws" {
  region = "us-west-2"
}
```
```
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
```
```
resource "aws_subnet" "example" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
}
```
```
resource "aws_nat_gateway" "example" {
  subnet_id = aws_subnet.example.id
  allocation_id = aws_eip.example.id
}
```
```
resource "aws_eip" "example" {
  vpc = true
}
```
```
resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

```
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
}
```

```
resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.example.id
  route_table_id = aws_route_table.example.id
}
```

```
resource "aws_instance" "example" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example.id
  vpc_security_group_ids = [aws_security_group.example.id]
}
```




# To create an EC2 instance in a private subnet that needs internet access, you can use a NAT Gateway or a NAT Instance. Here is an example Terraform script that creates an EC2 instance in a private subnet, along with a NAT Gateway for internet access:
```
Copy code
provider "aws" {
  region = "us-west-2"
}
```

```
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}
```
```
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = false
}
```
```
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id = aws_subnet.public.id
}
```
```
resource "aws_eip" "example" {
  vpc = true
}
```
```
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
}
```

```
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
```
```
resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

```
resource "aws_instance" "example" {
  ami           = "ami-0d5d9d301c853a04a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.example.id]
}
```

- In this example, the private subnet is created with the `map_public_ip_on_launch` attribute set to `false`, so that instances launched in the subnet will not be automatically assigned a public IP address. Then, it creates a NAT Gateway and associated it with the private subnet through the route table.
You also have to configure your AWS credentials in order to use terraform.




To launch two EC2 instances, one in a private subnet and one in a public subnet, you can use the same approach as before, but with an additional public subnet and an additional EC2 instance resource. Here is an example Terraform script that creates two EC2 instances, one in a private subnet and one in a public subnet, along with a NAT Gateway for internet access on the private subnet:

Copy code
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = false
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
}

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id = aws_subnet.public.id
}

resource "aws_eip" "example" {
  vpc = true
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-xxxxxxxx"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "example_private" {
  name        = "example_private"
  description = "Example security group for private subnet"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "example_public" {
  name        = "example_public"
  description =
  "Example security group for public subnet"
vpc_id = aws_vpc.example.id

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_instance" "example_private" {
ami = "ami-0d5d9d301c853a04a"
instance_type = "t2.micro"
subnet_id = aws_subnet.private.id
vpc_security_group_ids = [aws_security_group.example_private.id]
}

resource "aws_instance" "example_public" {
ami = "ami-0d5d9d301c853a04a"
instance_type = "t2.micro"
subnet_id = aws_subnet.public.id
vpc_security_group_ids =[aws_security_group.example_public.id]
}

Copy code
In this example, it creates two subnet, one is private which is the same as before, it is created with the `map_public_ip_on_launch` attribute set to false, so that instances launched in the subnet will not be automatically assigned a public IP address. Then, it creates a NAT Gateway and associated it with the private subnet through the route table. The second subnet is public, it is created with the `map_public_ip_on_launch` attribute set to true, so that instances launched in the subnet will be automatically assigned a public IP address. Then, it creates a Internet Gateway and associated it with the public subnet through the route table. It also creates two security group, one for the private and one for the public subnet. It also creates two EC2 instances, one in the private subnet and one in the public subnet, each one uses the security group that is associated with the corresponding subnet.
You also have to configure your AWS credentials in order to use terraform.


It is important to mention that, in this example, the Internet Gateway (IGW) is hardcoded in the script with the igw-xxxxxxxx placeholder, you should replace this with the actual ID of the IGW that you want to use. Also, if your VPC doesn't have an IGW yet, you need to create one.
Also, you may want to adjust the settings (e.g. region, AMI, instance type) to match your specific requirements.
Additionally, you can add more resources to the script, like an Elastic IP, Elastic Load Balancer, etc, according to your requirements.
Keep in mind that you should test this script in a test environment before applying it to a production environment.
Please let me know if you have any questions or need further assistance.