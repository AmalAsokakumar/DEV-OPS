# To deploy django based application. 
## building a cicd pipeline on aws for django

it has to following these steps. 
- iam creation 
- aws account creation 
- ec2 instance creation 
- code deploy installation 
- code structure 
- configuration files 
- code pipeline 
- test project on live server 


## 1. Creating  <span style="color:olive" >IAM </span>Roles 
1. Role one attach with ec2.
   <br> <span style="color:teal"> Creating the First Role. </span>
    ```
    IAM -> Roles -> Create role
        - Select trusted entity -> Trusted entity type -> AWS service
        - Use case -> EC2
        - Add permissions -> AmazonEC2RoleforAWSCodeDeploy
        - Name, review, and create -> Role details -> ec2-code-deploy-s3
    ```
2. attach with our code deploy.
       <br> <span style="color:teal"> Creating the Second Role. </span>

    ```
    IAM -> Roles -> Create role
        - Select trusted entity -> Trusted entity type -> AWS service
        - Use case for other AWS service -> CodeDeploy -> CodeDeploy
        - Name, review, and create -> Role details -> aws-codedeploy-role
    ```
## 2. Creating  <span style="color:olive" >Ec2 </span>instances 
- AMI
- CodeDeploy agent

1. <span style="color:teal"> Creating Ec2 instance . </span>

```
Launch an instance
 - Name and tags -> django server
 - AMI -> Ubuntu Server 20.04 LTS
 - Instance Type -> t2.micro
 - Key pair (login) -> code-deploy.pem
 - Network settings -> default setting -> Allow Https Traffic from the internet
 - proceed to launch the instance 
```

2. <span style="color:teal"> Attaching Iam Policy to the instance . </span>

```
- select Django Server instance -> Actions -> Security -> Modify IAM Role ->IAM role -> ec2-code-deploy-s3

- Update Iam role
- Reboot instance to make this role effective

```
3. <span style="color:teal"> Install Code Deploy Agent in the Machine . </span>

```
- connect to ec2 instance "django server" using ssh or ec2 connect.
- run the following commands 

    we can bootstrap these scripts into user-data also or run manuel.

        sudo apt update -y 
        sudo apt install -y ruby-full
        sudo apt install -y wget
        wget https://aws-codedeploy-us-west-2.s3.us-west-2.amazonaws.com/latest/install
        sudo chmod +x ./install
        # logging the output of the installation to /tmp/logfile file.
        sudo ./install auto > /tmp/logfile

        # to check if the agent is running 
        sudo service codedeploy-agent status 
```