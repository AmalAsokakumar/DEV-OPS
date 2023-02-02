# Availability and Scalability

High availability and scalability in AWS can be achieved through a variety of services and techniques.

For high availability, AWS offers services such as Elastic Load Balancing, Auto Scaling, and Amazon RDS Multi-AZ. These services can automatically distribute traffic across multiple resources, such as EC2 instances, and automatically failover to a secondary resource in the event of an outage.

For scalability, AWS offers services such as Auto Scaling, Amazon Elastic Container Service, and Amazon Elastic Kubernetes Service. These services can automatically increase or decrease the number of resources based on demand, allowing for efficient use of resources and cost savings. Additionally, AWS offers services like Amazon CloudFront, Amazon S3 and Amazon Route53 which can help in achieving high availability and scalability. The use of AWS Elastic Beanstalk, and AWS Lambda can also help in achieving scalability


# There are several types of scalability that can be achieved in AWS:

- Vertical scaling: This type of scaling involves increasing the resources (such as memory or CPU) of a single instance to handle increased traffic or workload.
- Horizontal scaling: This type of scaling involves adding more instances to a network to handle increased traffic or workload. This can be achieved through services like Auto Scaling and Elastic Load Balancing in AWS.
- Scale-up and scale-out: Scale-up means increasing the capacity of a single resource, while scale-out means adding more resources to the network. These two types of scaling can be used together to achieve optimal performance and cost efficiency.
- Scaling based on usage: This type of scaling involves automatically increasing or decreasing resources based on actual usage, rather than pre-set thresholds. This can be achieved through services like Amazon CloudWatch and AWS Auto Scaling.
- Scaling based on demand: This type of scaling involves automatically increasing or decreasing resources based on predicted demand. This can be achieved through services like Amazon Forecast and AWS Auto Scaling.

# High availability

High availability refers to the ability of a system or service to remain operational and accessible to users during planned or unplanned outages or maintenance. In other words, high availability ensures that a system or service is always available and able to handle requests.

AWS provides several services and features to help achieve high availability, such as:

- Amazon Elastic Block Store (EBS) and Amazon Elastic File System (EFS) for storage.
Amazon RDS Multi-AZ and Amazon Aurora for database services.

- Amazon Elastic Load Balancing and Amazon CloudFront for distributing traffic across multiple resources.
- Amazon Route 53 for routing traffic to healthy resources.
- Auto Scaling for automatically provisioning and de-provisioning resources based on demand.
- AWS Elastic Beanstalk, AWS Lambda and AWS App Runner for deploying and scaling applications.
- Amazon CloudWatch for monitoring and alerting for availability.

By using these services and features together, you can design a highly available system that can quickly failover to another resource in case of an outage, and can automatically scale to handle increased traffic.

# What is LoadBalancing ?

Load balancing is the process of distributing incoming network traffic across multiple servers or resources in order to optimize resource usage, minimize response time, and avoid overloading any single resource. The goal of load balancing is to ensure that no single server is overwhelmed with too many requests, and that all servers are utilized efficiently. This can improve the overall performance and availability of a system.

AWS offers several services for load balancing:

- Elastic Load Balancing (ELB): This service automatically distributes incoming web traffic across multiple Amazon Elastic Compute Cloud (EC2) instances.

- Application Load Balancer (ALB): This service routes incoming traffic to the target group that you specify based on the content of the request.
- Network Load Balancer (NLB): This service routes incoming TCP/UDP traffic to the target group that you specify based on IP protocol data.
- Amazon Route 53: This service provides routing for your domain name system (DNS) traffic to healthy resources.

These services can be used to distribute traffic across multiple resources, such as EC2 instances, containers, and IP addresses, in order to improve the availability and performance of your applications.


An Elastic Load Balancer (ELB) is a service provided by Amazon Web Services (AWS) that automatically distributes incoming web traffic across multiple Amazon Elastic Compute Cloud (EC2) instances. This helps to increase the availability and scalability of the application.

It is used to distribute the incoming traffic across multiple instances, this way if one instance goes down, the traffic is automatically routed to the remaining available instances, which ensures the high availability of the application.

It also performs health checks on the instances and only routes traffic to the healthy instances, which helps to ensure that the clients are always served by a functional server.

It is used in the cloud computing environment, mainly in AWS, to balance the load of incoming traffic and ensure the high availability and scalability of the application. It can be used for different types of applications, such as web, mobile, gaming, and IoT applications.


Additionally, ELB can also route traffic to different instances based on the content of the request, allowing for more fine-grained control over the distribution of traffic. This can be useful for situations where you have different types of requests that need to be handled by different instances. For example, you can route all traffic that comes from a specific country to a specific group of instances, or route all traffic that uses a specific protocol to a different group of instances.

Another important feature of ELB is that it provides a single point of contact for clients. This means that clients only need to connect to the ELB's endpoint, and the ELB will take care of routing the traffic to the appropriate instances. This can be useful for situations where you need to change the number of instances that are running, or if you need to replace instances with newer versions.

Overall, Elastic Load Balancer is an important tool for managing the traffic of a high-availability and high-scalability cloud-based applications, it ensures that the application is available and responsive to the client's requests and it distributes the load evenly to make the best use of the resources.



# There are four types of Load Balancers (LBs) in AWS:

- Application Load Balancer (ALB): This is a `Layer 7` load balancer that routes `HTTP/HTTPS` traffic to the target group based on the content of the request. It also supports advanced features such as `path-based routing`, `host-based routing`, and `redirects`. It is best suited for `application-level` routing and can be used for `microservices`, `containerized applications`, and non-HTTP/HTTPS protocols.

- Network Load Balancer (NLB): This is a `Layer 4` load balancer that routes `TCP/UDP` traffic to the target group based on `IP protocol data`. It is best suited for handling `high performance workloads` with `very low latency` and `high throughput`.
- Classic Load Balancer (CLB): This is a `Layer 4 `load balancer that routes `TCP/SSL` traffic to the target group based on IP protocol data. It is the `oldest type of ELB`, it is recommended to use either ALB or NLB if possible.

- A `Gateway Load Balancer` is a service provided by AWS that allows you to `distribute` incoming `traffic` to `multiple services` or applications running in an Amazon Virtual Private Cloud (`VPC`) or `on-premises`. It is a Layer 3 load balancer that routes traffic based on the IP protocol data, similar to a traditional load balancer.

    The Gateway Load Balancer enables you to build a `hybrid architecture` where you can `route traffic` `between on-premises` and `cloud-based resources`. It also allows you to create service meshes with fine-grained traffic management, it can also be used to `route traffic` to `multiple VPCs`, and even `different accounts` and `regions`.

    It also supports features such as Health Checks, Automatic Failover, and SSL offloading. It is a good option for the scenarios where you need to route traffic between on-premises and cloud resources, or you need to route traffic between multiple VPCs or different accounts.

AWS also offers the Application Load Balancer (ALB) and Network Load Balancer (NLB) as part of the Elastic Load Balancing service, while the Classic Load Balancer (CLB) is being phased out.



# Application Load Balancer

An Application Load Balancer (ALB) is a type of load balancer provided by Amazon Web Services (AWS) that routes incoming web traffic to multiple Amazon Elastic Compute Cloud (EC2) instances or containers in one or more Amazon Virtual Private Clouds (VPCs). ALBs can route incoming traffic based on the content of the request, such as the URL path or host header, allowing for more advanced routing and traffic management than a Classic Load Balancer. ALBs also provide features such as SSL/TLS termination, health checks, and integration with other AWS services like AWS Lambda and Amazon Elastic Container Service (ECS).


Application Load Balancers are typically used in web-based applications that have multiple servers or instances running behind the load balancer. The load balancer distributes incoming traffic among the available servers, ensuring that no single server is overwhelmed and that requests are handled in a timely manner.

To use an Application Load Balancer, you would first create one in the AWS Management Console or via the AWS command-line interface. You would then configure the load balancer with the desired routing rules and target servers, and associate it with one or more Amazon Virtual Private Clouds (VPCs).

Once the load balancer is set up, you would configure your web application to send requests to the load balancer's endpoint. The load balancer would then route the requests to the appropriate server based on the configured routing rules.

It's also possible to use ALB with other services such as AWS Lambda, Amazon Elastic Container Service (ECS), and AWS Elastic Beanstalk. ALB can route incoming traffic to these services directly without the need of running EC2 instances.

Additionally, you can monitor and troubleshoot the load balancer's performance using CloudWatch metrics, access logs, and access to Application Load Balancer's status page.


- Application Load Balancers (ALBs) are a type of load balancer provided by Amazon Web Services (AWS) that route incoming web traffic to multiple Amazon Elastic Compute Cloud (EC2) instances or containers in one or more Amazon Virtual Private Clouds (VPCs).
- ALBs are typically used in web-based applications that have multiple servers or instances running behind the load balancer.
- To use an Application Load Balancer, you would first create one in the AWS Management Console or via the AWS command-line interface, and then configure the load balancer with the desired routing rules and target servers.
- ALBs can route incoming traffic based on the content of the request, such as the URL path or host header, allowing for more advanced routing and traffic management than a Classic Load Balancer.
- ALBs also provide features such as SSL/TLS termination, health checks, and integration with other AWS services like AWS Lambda and Amazon Elastic Container Service (ECS).
- Once the load balancer is set up, you would configure your web application to send requests to the load balancer's endpoint and the load balancer would then route the requests to the appropriate server based on the configured routing rules.
- You can monitor and troubleshoot the load balancer's performance using CloudWatch metrics, access logs, and access to Application Load Balancer's status page.


# Network Load Balancer 

Amazon Web Services (AWS) Network Load Balancer (NLB) is a service that distributes incoming network traffic across multiple Amazon Elastic Compute Cloud (EC2) instances. NLB uses the Transmission Control Protocol (TCP) and User Datagram Protocol (UDP) protocols to distribute traffic, and can handle millions of requests per second. NLB is used to improve the availability and scalability of applications running on EC2 instances. NLB can be used in various use cases such as, handling incoming traffic from the internet to a web application, manage traffic across multiple availability zones, and more.


Some of the key features of Amazon Web Services (AWS) Network Load Balancer (NLB) include:

High performance: NLB can handle millions of requests per second, making it suitable for high-traffic applications.
TCP and UDP support: NLB can distribute traffic using both TCP and UDP protocols, which makes it suitable for a wide range of applications.
Low Latency: NLB uses a flow-hash algorithm to distribute traffic, which results in low latency and minimal connection interruptions.
Multiple Availability Zones: NLB allows you to distribute incoming traffic across multiple availability zones, providing high availability for your applications.
Health Checks: NLB can automatically detect and route traffic away from instances that are not responding or are experiencing high latency.
Target groups : NLB allows you to route traffic to different target groups based on rules you define.
Scale automatically : NLB can automatically scale to handle changes in traffic, so you don't have to manually add or remove instances.
IPv4 and IPv6 support : NLB supports both IPv4 and IPv6 addresses, making it possible to use with a wide range of clients.
Access Logs: NLB can generate access logs, which allows you to monitor and troubleshoot your applications.
Integration with other AWS services: NLB can be integrated with other AWS services, such as Amazon CloudWatch and AWS Elastic Beanstalk, to provide additional functionality.