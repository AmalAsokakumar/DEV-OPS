Cross-zone load balancing is a feature of the Elastic Load Balancing service (ELB) in Amazon Web Services (AWS) that allows for the distribution of incoming traffic across all the availability zones (AZs) in a region. This ensures that traffic is evenly distributed across all the availability zones, providing high availability and fault tolerance.

When cross-zone load balancing is enabled, the ELB automatically distributes incoming traffic across all the available instances in all the availability zones in the region. This helps to ensure that traffic is evenly distributed, even if some instances or availability zones become unavailable.

Cross-zone load balancing is enabled by default for Application Load Balancers and Network Load Balancers, but it can be disabled if needed.

To enable or disable cross-zone load balancing for an existing Application Load Balancer or Network Load Balancer, you can use the AWS Management Console, AWS CLI or SDKs.

Here is an example of how to enable cross-zone load balancing using the AWS CLI:

ruby

`
aws elbv2 modify-load-balancer-attributes --load-balancer-arn arn:aws:elasticloadbalancing:us-west-2:123456789012:loadbalancer/app/my-load-balancer/50dc6c495c0c9188 --attributes Key=cross_zone_load_balancing.enabled,Value=true
`
It's important to note that cross-zone load balancing can help to improve the fault-tolerance and availability of your application, but it does not improve the performance. It is important to monitor the performance of your application and the load balancer in each availability zone and make adjustments as necessary.