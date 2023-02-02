# Setting up a Network Load Balancer on AWS

In this guide, we will show you how to set up an NLB on AWS.

## Prerequisites

1. An AWS account
2. EC2 instances that you want to use as the target of the NLB
3. A VPC to create the NLB in

## Step 1: Create a Target Group
1. Go to the Amazon Elastic Container Service (ECS) console
2. Click on "Target Groups" in the navigation pane
3. Click on "Create target group"
4. Enter a name for the target group and select "IP" as the target type
5. Click on "Create"

## Step 2: Register Targets
1. Go to the Target Groups section of the ECS console
2. Select the target group you just created
3. Click on "Edit"
4. Click on "Add to registered"
5. Select the instances you want to use as targets and click on "Add to registered"

## Step 3: Create the Network Load Balancer
1. Go to the EC2 console
2. Click on "Load Balancers" in the navigation pane
3. Click on "Create Load Balancer"
4. Select "Network Load Balancer"
5. Enter a name for the NLB and select the VPC you want to create the NLB in
6. Select the subnets you want to use for the NLB
7. Click on "Next: Configure Security Settings"
8. Select the security group you want to use for the NLB
9. Click on "Next: Configure Routing"
10. Select the target group you created in step 1
11. Click on "Next: Register Targets"
12. Select the instances you want to use as targets
13. Click on "Next: Review"
14. Review your settings and click on "Create"

## Step 4: Test the Network Load Balancer
1. Go to the EC2 console
2. Click on "Load Balancers" in the navigation pane
3. Select the NLB you just created
4. Click on the "Description" tab
5. Make note of the DNS name of the NLB
6. Open a web browser and enter the DNS name of the NLB in the address bar
7. Verify that the NLB is working by checking that you can access the web application on the instances you registered as targets

## Conclusion

You have now set up an NLB on AWS. You can use this NLB to distribute incoming traffic across multiple instances, improving the availability and scalability of your applications.

