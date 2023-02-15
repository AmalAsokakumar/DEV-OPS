Here's a basic example of how to set up a Classic Load Balancer (CLB) on AWS:

Step 1: Prerequisites
AWS account
Two or more instances to use as targets for the CLB
A security group for the CLB that allows incoming traffic on port 80 (or the desired port for your application)
Step 2: Create a Classic Load Balancer
Open the Amazon EC2 console at https://console.aws.amazon.com/ec2/
In the navigation pane, under "LOAD BALANCING", click on "Load Balancers"
Click on "Create Load Balancer"
Select "Classic Load Balancer" and click on "Create"
Enter a name and description for the CLB
Select the VPC and availability zones where you want to create the CLB
Click on "Next: Assign Security Groups"
Select the security group you created in the prerequisites and click on "Next: Configure Security Settings"
(Optional) Configure any desired security settings and click on "Next: Configure Health Check"
Configure the health check settings for the CLB, such as ping target, interval, and timeout
Click on "Next: Add EC2 Instances"
Select the instances you want to use as targets for the CLB and click on "Add to registered"
Click on "Next: Add Tags"
(Optional) Add any desired tags for the CLB and click on "Next: Review"
Review the settings for the CLB and click on "Create"
Step 3: Configure Routing
In the navigation pane, under "LOAD BALANCING", click on "Load Balancers"
Select the CLB that you created
Click on the "Listeners" tab
Click on "Edit" button next to the listener you want to configure.
Under "Instance protocol" select the protocol you want the CLB to use.
Under "Instance port" select the port you want the CLB to use.
Under "Load Balancer protocol" select the protocol you want the CLB to use to communicate with the clients.
Under "Load Balancer port" select the port you want the CLB to use to communicate with the clients.
Click on "Save"
Step 4: (Optional) Enable HTTPS
Go to the EC2 console
Click on "Load Balancers" in the navigation pane
Select the CLB you just created
Click on "Listeners" in the navigation pane
Click on the "Edit" button next to the HTTPS listener you want to enable
Click on "Change" next to the certificate field
Select "Upload a new SSL certificate to AWS Identity and Access Management (IAM)"
Click on "Save"
With these steps, you have successfully set up a Classic Load Balancer (CLB) on AWS.

Additionally, for step 4, you can also use a pre-existing certificate from AWS Certificate Manager (ACM) or import a certificate from a third party provider.

Step 5: Test the CLB
Open a web browser and enter the public DNS name or IP address of the CLB
Verify that the CLB is routing traffic to the instances you registered as targets by checking that you can access the web application on the instances
Step 6: (Optional) Create a DNS record
Go to the Route 53 console
Click on "Hosted zones" in the navigation pane
Click on the "Create Record Set" button
In the "Name" field, enter the custom domain name you want to use for the CLB
In the "Type" field, select "A"
In the "Value" field, enter the public IP address of the CLB
Click on "Save Record Set"
Wait for the DNS changes to propagate (this can take up to 48 hours)
Open a web browser and enter the custom domain name in the address bar
Verify that the CLB is working by checking that you can access the web application on the instances you registered as targets
This is the basic example to setup the Classic Load balancer in AWS. 