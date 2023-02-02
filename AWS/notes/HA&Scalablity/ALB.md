# Setting up an Application Load Balancer on AWS

In this guide, we will show you how to set up an ALB on AWS.


## Prerequisites

- An AWS account
- EC2 instances that you want to use as the target of the ALB
- A VPC to create the ALB in
- A domain name (if you want to use a custom domain name for the ALB)

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

## Step 3: Create the Application Load Balancer
1. Go to the EC2 console
2. Click on "Load Balancers" in the navigation pane
3. Click on "Create Load Balancer"
4. Select "Application Load Balancer"
5. Enter a name for the ALB and select the VPC you want to create the ALB in
6. Select the subnets you want to use for the ALB
7. Click on "Next: Configure Security Settings"
8. Select the security group you want to use for the ALB
9. Click on "Next: Configure Routing"
10. Select the target group you created in step 1
11. Click on "Next: Register Targets"
12. Select the instances you want to use as targets
13. Click on "Next: Review"
14. Review your settings and click on "Create"

## Step 4: Configure Listeners

1. Go to the EC2 console
2. Click on "Load Balancers" in the navigation pane
3. Select the ALB you just created
4. Click on "Listeners" in the navigation pane
5. Click on "Add listener"
6. Select "HTTP" or "HTTPS" as the protocol
7. Enter the port you want to use (e.g. 80 or 443)
8. Select the target group you created in step 1
9. Click on "Save"

## Step 5: Test the Application Load Balancer

1. Go to the EC2 console
2. Click on "Load Balancers" in the navigation pane
3. Select the ALB you just created
4. Click on the "Description" tab
5. Make note of the DNS name of the ALB
6. Open a web browser and enter the DNS name of the ALB in the address bar
7. Verify that the ALB is working by checking that you can access the web application on the instances you registered as targets

## Step 6: (Optional) Register custom domain

1. Go to the Route53 console
2. Click on "Create Hosted Zone"
3. Enter the domain name you want to use for the ALB
4. Click on "Create"
5. Create an "A" record In the "Value" field, enter the DNS name of the ALB you noted in step 5
6. Click on "Save Record Set"
7. Wait for the DNS changes to propagate (this can take up to 48 hours)
8. Open a web browser and enter the custom domain name in the address bar
9. Verify that the ALB is working by checking that you can access the web application on the instances you registered as targets

## Step 7: (Optional) Enable HTTPS

1. Go to the EC2 console
2. Click on "Load Balancers" in the navigation pane
3. Select the ALB you just created
4. Click on "Listeners" in the navigation pane
5. Click on the "Edit" button next to the HTTPS listener you want to enable
6. Click on "Change" next to the certificate field
7. Select "Request a new certificate from ACM"
8. Enter the domain name you want to secure with the certificate
9. Click on "Next"
10. Select the email address you want to use for the certificate validation
11. Click on "Review"
12. Review your settings and click on "Confirm and request"
13. Wait for the certificate to be issued (this can take up to several minutes)
14. Select the certificate you just requested and click on "Save"

With these steps, you have successfully set up an Application Load Balancer (ALB) on AWS.