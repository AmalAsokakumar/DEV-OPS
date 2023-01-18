# A detailed over view of what are these components and how they related.

## aws provider is used in this project 
```
provider "aws" {
  region = var.avail_zone
}
```

# create a new vpc.
- VPC stands for Virtual Private Cloud. It is a virtual network that allows users to launch AWS resources, such as Amazon Elastic Compute Cloud (EC2) instances, in a virtual environment that is isolated from the public internet.

- This allows users to create a virtual network that is similar to a traditional on-premises network, but that is hosted on the AWS cloud.

- A VPC allows users to control network configurations, such as IP address ranges, subnets, and security groups, and to connect to other networks via a VPN or Direct Connect.

-  Additionally, VPCs also provide additional features like security, isolation, and control over the network and traffic flow to and from the resources.

```
resource "aws_vpc" "demo-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}
```
- the three components that are created along with the vpc are the, ACL, DHCP and route table.

# create a subnet for the vpc.
- A subnet is used within a VPC (Virtual Private Cloud) to segment the VPC's IP address range into smaller, more manageable ranges. 

- This allows for better security and organization of resources within the VPC.

- Additionally, subnets can also be used to isolate different types of workloads or to launch resources in different availability zones for added resiliency.

```
resource "aws_subnet" "demo-subnet" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.subnet_cidr_blocks[0]
  availability_zone = var.subnet_cidr_blocks[1]
  tags = {
    Name = "${var.env_prefix}-subnet"
  }
}
```
# creating a route table 

- A route table, also known as a routing table, is a database that contains information about the routes that a router or other networking device should use to forward packets of data. Each entry in a route table, called a route, consists of a destination IP address and a set of instructions for how to reach that destination, such as the next hop IP address or the interface to use.

- A route table is used to determine the path that network traffic should take to reach its destination. When a device receives a packet of data, it looks up the destination IP address in its route table to find the best path to forward the packet. If the device finds a match, it will forward the packet according to the instructions in the matching route. If it does not find a match, it will drop the packet or forward it to a default gateway.

- In a VPC, every subnet must be associated with a route table that controls the traffic flow in and out of the subnet.
- You can create multiple route tables and associate them with different subnets. This allows you to control the traffic flow between subnets and control the access to the internet, VPNs or other VPCs.

Additionally, you can also create custom routes and static routes in route tables to control the traffic flow more granularly

```
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
```
# creating an internet gateway

- An Internet Gateway is a VPC component that allows communication between instances in your VPC and the Internet. It is a horizontally scaleable, redundant, and highly available VPC component that allows communication between instances in your VPC and the Internet. It therefore enables communication for resources that have a public IP address assigned to them, or that you have specified as a destination in your route table.

- An Internet Gateway is used to provide Internet connectivity for resources launched in a VPC. Without an Internet Gateway, resources launched in a VPC would not be able to communicate with the Internet. This is useful when you want to launch resources in a VPC and make them accessible to the Internet.

- Additionally, the Internet Gateway also enables communication for resources that have a public IP address assigned to them, or that you have specified as a destination in your route table. This allows for incoming and outgoing internet traffic to flow seamlessly in and out of the VPC.

It is important to note that, Internet Gateway is a `stateful entity` which means it tracks the IP address of the instances so it can route the return traffic back to the instances.

```
resource "aws_internet_gateway" "demo-internet-gateway" {
  vpc_id = aws_vpc.demo-vpc.id
}
```

# Associating route table with the subnet.

- A route table is associated with a subnet to control the traffic flow in and out of that subnet. Each subnet in a VPC must be associated with a route table, and the route table controls the traffic flow in and out of that subnet.

- When a packet of data is sent to a subnet, the device that receives the packet looks up the destination IP address in the associated route table to determine the best path to forward the packet. The route table contains a set of rules, called routes, that specify the destination IP addresses and the next hop IP addresses or interfaces to use.

- Associating a route table with a subnet allows you to control access to the Internet, VPNs, and other VPCs for resources launched in that subnet. For example, you can create a route table with a route that directs all traffic to a specific IP address to a virtual private gateway, and associate that route table with a subnet that contains resources that need to access a VPN.

- It also allows you to control the flow of traffic between subnets, so you can segment your VPC into different security or functional zones, and limit the communication between those zones.

 Additionally, you can also create custom routes and static routes in route tables to control the traffic flow more granularly, based on the specific needs of your application or network.

```
resource "aws_route_table_association" 
"demo-route-table-association-with-subnet" {
  subnet_id      = aws_subnet.demo-subnet.id
  route_table_id = aws_route_table.demo-route-table.id
}
```

# using the default route table.

```
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
```

# configure the security group

```
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
```



# default security group
```
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
```
# VPC and Subnet

1. A VPC (Virtual Private Cloud) is a virtual network that allows you to launch AWS resources, such as Amazon Elastic Compute Cloud (EC2) instances, in a virtual environment that is isolated from the public internet. A VPC is like a traditional on-premises network, but it is hosted on the AWS cloud.

2. A subnet is a segment of a VPC's IP address range that you can launch resources in. It is used to organize and segment the VPC into smaller, more manageable ranges. Each subnet is associated with a route table that controls the traffic flow in and out of that subnet.

3. When you create a VPC, you specify the IP address range for the VPC. This range is then divided into smaller ranges, called subnets, which you can launch resources in. For example, you might create a VPC with a CIDR block of 10.0.0.0/16 and then create two subnets, one with a CIDR block of 10.0.0.0/24 and another with a CIDR block of 10.0.1.0/24.

4. Each subnet must be associated with a route table that controls the traffic flow in and out of that subnet. You can create multiple route tables and associate them with different subnets to control the traffic flow between subnets and control the access to the Internet, VPNs, or other VPCs.

6. Additionally, you can also associate a subnet with a network ACL (Access Control List) which provide an additional layer of security for the subnet, by allowing or denying traffic based on IP address and port number.

7. Overall, a VPC is the container for your entire cloud resources, and the subnets are the segments within that container, which you can use to organize and manage your resources in a more efficient and secure way.

# ACL 

1. An ACL (Access Control List) is a set of rules that are used to control access to a network or subnet. It is a security feature that can be used to filter incoming and outgoing network traffic based on IP addresses and ports.

2. In a VPC, an ACL is associated with a subnet and it acts as a firewall to control inbound and outbound traffic at the subnet level. It has two types of rules:

3. Inbound rules: These rules control the traffic that is coming into the subnet. They allow or deny traffic based on the source IP address and port.
Outbound rules: These rules control the traffic that is leaving the subnet. They allow or deny traffic based on the destination IP address and port.
4. ACLs have a default deny all rule, meaning that by default, all traffic is blocked. To allow specific traffic, you can create rules that permit traffic that matches the specified criteria.

5. You can use ACLs to control access to your VPC resources in a more granular way, by allowing or denying traffic based on specific IP addresses and ports. For example, you can use an ACL to allow only specific IP addresses to access a subnet, or to allow only certain types of traffic, such as HTTP or HTTPS traffic, to pass through.

6. ACLs are stateless, meaning that return traffic is subject to the rules of the ACL, unlike security groups which are stateful.

7. ACLs can be used in conjunction with other security features, such as security groups and network security protocols, to provide a comprehensive security solution for your VPC.

# security group 

1. A security group is a virtual firewall that controls inbound and outbound traffic to resources launched in a VPC. It is used to secure access to the resources in your VPC by specifying which IP addresses or protocols are allowed to access the resources.

2. Each security group has a set of rules that define the traffic that is allowed to reach the resources associated with that security group. The rules specify the source IP addresses and ports, as well as the protocol (TCP, UDP, ICMP) that are allowed. By default, all incoming traffic is blocked, and you must create rules to allow specific traffic to reach the resources.

3. Security groups are associated with resources, such as Amazon Elastic Compute Cloud (EC2) instances, and they function at the transport layer of the OSI model. Security groups are stateful, meaning that they allow the return traffic automatically, based on the outbound rules.

4. Security groups are used to provide an additional layer of security for resources launched in a VPC. They can be used to control access to resources based on IP addresses, protocols, and ports. For example, you can create a security group that allows only traffic from a specific IP address range to reach a resource, or that allows only HTTP or HTTPS traffic to reach a resource.

5. Security groups can also be used to segment resources within a VPC, by creating different security groups for different types of resources and applying different rules to each security group. This allows you to control the traffic flow between resources and to isolate resources that have different security requirements.

6. Overall, security groups are a powerful security feature that allows you to control access to your VPC resources and to segment your VPC into different security zones, making it more difficult for unauthorized users to access your resources.



# In AWS, VPC, subnet, route table, NAT, Internet Gateway, Elastic IP, private subnet, public subnet, and security group are all related to each other and work together to provide a virtual networking environment for your AWS resources. Here is a brief overview of how they are related:

1. VPC: A VPC is the main container for your entire cloud resources, it allows you to create a virtual network in the AWS cloud.

2. Subnet: A subnet is a segment of a VPC's IP address range that you can launch resources in. It is used to organize and segment the VPC into smaller, more manageable ranges. Each subnet must be associated with a route table that controls the traffic flow in and out of that subnet.

3. Route Table: A route table is a database that contains information about the routes that a router or other networking device should use to forward packets of data. Each subnet in a VPC must be associated with a route table, and the route table controls the traffic flow in and out of that subnet.
4. NAT: NAT (Network Address Translation) is a mechanism that allows instances in a private subnet to communicate with the Internet without the need for a public IP address.
5. Internet Gateway: An Internet Gateway is a VPC component that allows communication between instances in your VPC and the Internet, it enables communication for resources that have a public IP address assigned to them.
6. Elastic IP: An Elastic IP is a static, public IPv4 address that can be allocated to your AWS account, and can be associated with resources such as instances or network interfaces.
7. Private subnet: A private subnet is a subnet that does not have a direct route to the Internet, instances in a private subnet cannot be directly accessed from the Internet.
8. Public subnet: A public subnet is a subnet that has a direct route to the Internet, instances in a public subnet can be directly accessed from the Internet.
9. Security Group: A security group is a virtual firewall that controls inbound and outbound traffic to resources launched in a VPC. It is associated with resources, such as Amazon Elastic Compute Cloud (EC2) instances, and it functions at the transport layer of the OSI model.
- To link one with another, you can do this by creating the resources and associating them with each other. For example, you can create a VPC, then create subnets in that VPC and associate them with a route table. You can also create an Internet Gateway and associate it with the VPC. You can create a security group and associate it with an EC2 instances or a network interface. You can also create a NAT Gateway or NAT instance and associate it with a route table.

- The relationship between these resources is that VPCs are the main container for your resources and subnets are the segments within that container. Route tables control the traffic flow in and out of the subnets. Internet Gateway enables communication between instances in your VPC and the Internet. Elastic IPs are static IP addresses that can be allocated to your AWS account and associated with resources such as instances or network interfaces. Security groups are virtual firewalls that control inbound and outbound traffic to resources launched in a VPC.

  - NAT (Network Address Translation) is used to enable instances in a private subnet to communicate with the Internet, without the need for a public IP address. A NAT gateway or NAT instance can be placed in a public subnet, and all outbound traffic from instances in a private subnet will be sent to the NAT gateway or instance before being sent to the Internet. This allows instances in the private subnet to communicate with the Internet for software updates, for example, without having a public IP address.

  - Elastic IPs are also related to NAT, as they can be used in conjunction with a NAT gateway or instance. An Elastic IP is a static, public IPv4 address that can be allocated to your AWS account, and can be associated with a NAT gateway or instance, allowing your instances in a private subnet to communicate with the Internet using a static IP address.

  - Public and private subnets are also related, as they are used to segment the VPC into different security zones. A public subnet is a subnet that has a direct route to the Internet, allowing instances to be directly accessed from the Internet, while a private subnet does not have a direct route to the Internet, instances in a private subnet cannot be directly accessed from the Internet.

Overall, all these resources are related to each other and they work together to provide a secure and highly available virtual networking environment for your AWS resources. You can create and link them together based on your specific needs and use cases.

- Another important component that is related to VPC, subnet and route table is the Network ACL (Access Control List). Network ACLs provide an additional layer of security for the subnet, by allowing or denying traffic based on IP address and port number. It is associated with the subnet and it acts as a firewall to control inbound and outbound traffic at the subnet level.

- You can use Network ACLs to control access to your VPC resources in a more granular way, by allowing or denying traffic based on specific IP addresses and ports. For example, you can use an ACL to allow only specific IP addresses to access a subnet, or to allow only certain types of traffic, such as HTTP or HTTPS traffic, to pass through.

- Another component that is related is the VPC Endpoints. VPC Endpoints enables you to privately connect your VPC to services powered by AWS, without requiring an Internet Gateway, VPN or a NAT device. It enables communication between instances in your VPC and services over an Amazon VPC private link. This is useful when you want to access services like S3 or DynamoDB from your VPC without going over the Internet.

- VPC Peering is also a component that is related, it allows you to connect one VPC with another VPC using private IP addresses, as if they were in the same network. This enables communication between instances in different VPCs, without the need for a VPN or a Direct Connect link.

- All these components work together to provide a robust and secure virtual networking environment for your AWS resources. They allow you to control access to your resources, segment your VPC into different security zones, and connect your VPC to other services and VPCs in a private and secure way.

- When creating a VPC, you can specify the IP address range and create subnets within that range. Each subnet must be associated with a route table that controls the traffic flow in and out of that subnet. You can create multiple route tables and associate them with different subnets to control the traffic flow between subnets and control the access to the Internet, VPNs, or other VPCs.

- An Internet Gateway is used to provide Internet connectivity for resources launched in a VPC. It enables communication for resources that have a public IP address assigned to them, or that you have specified as a destination in your route table.

- NAT is used to enable instances in a private subnet to communicate with the Internet without the need for a public IP address. A NAT gateway or NAT instance can be placed in a public subnet, and all outbound traffic from instances in a private subnet will be sent to the NAT gateway or instance before being sent to the Internet.

- Security groups are used to provide an additional layer of security for resources launched in a VPC. They can be used to control access to resources based on IP addresses, protocols, and ports.