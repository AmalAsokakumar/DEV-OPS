#!/bin/bash
echo "instlling depencies"
sudo yum -y update
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install java-1.8.0-openjdk -y
sudo yum -y install ruby wget
echo "installing codedeploy"
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto 
echo "installing tomcat"
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
tar -xvzf apache-tomcat-9.0.65.tar.gz
sudo chmod +x ./apache-tomcat-9.0.65/bin/.startup.sh
sudo ./apache-tomcat-9.0.65/bin/.startup.sh

# sudo chmod +x /home/ec2-user/tomcat/apache-tomcat*/bin  ./startup.sh
# sudo /home/ec2-user/tomcat/apache-tomcat*/bin ./startup.sh