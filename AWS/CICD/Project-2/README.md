# To deploy django based application using AWS `CI-CD`
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

## 3. Setting up <span style="color:olive" >Django application and Scripts </span> 


1. <span style="color:teal"> Gunicon config </span>

    `gunicorn.service`

    ```    
    [Unit]
    Description=gunicorn daemon
    Requires=gunicorn.socket
    After=network.target
    [Service]
    User=ubuntu
    Group=www-data
    WorkingDirectory=/home/ubuntu/aws-cicd
    ExecStart=/home/ubuntu/env/bin/gunicorn --access-logfile - --workers 3 --bind unix:/home/ubuntu/aws-cicd/blog/blog.sock blog.wsgi:application

        
    [Install]
    WantedBy=multi-user.target

    ```
    <br><br>

    `gunicorn.socket`

    ```
    [Unit]
    Description=gunicorn socket
    [Socket]
    ListenStream=/run/gunicorn.sock
    [Install]
    WantedBy=sockets.target

    ```

1. <span style="color:teal"> Nginx config </span>

    `nginx.conf`

    ```
        server {
        listen 80 default_server;
        server_name 35.166.194.254;
        location = /favicon.ico { access_log off; log_not_found off; }
        location /staticfiles/ {
            root /home/ubuntu/aws-cicd;
        }
        location / {
            include proxy_params;
            proxy_pass http://unix:/run/gunicorn.sock;
        }
    }
    ```

1. <span style="color:teal"> appspec.yaml </span> 

    `appspec.yml`

    ```
    version: 0.0
    os: linux
    files: 
    - source: /
        destination: /home/ubuntu/aws-cicd
    permissions:
    - object: /home/ubuntu/aws-cicd
        owner: ubuntu
        group: ubuntu
    hooks:
    BeforeInstall:
        - location: scripts/clean_instance.sh
            timeout: 300
            runas: ubuntu
    AfterInstall:
        - location: scripts/instance_os_dependencies.sh
            timeout: 300
            runas: ubuntu
        - location: scripts/python_dependencies.sh
            timeout: 300
            runas: ubuntu
        - location: scripts/gunicorn.sh
            timeout: 300
            runas: ubuntu
        - location: scripts/nginx.sh
            timeout: 300
            runas: ubuntu
    ApplicationStop:
        - location: scripts/stop_app.sh
            timeout: 300
            runas: ubuntu
    ApplicationStart:
        - location: scripts/start_app.sh
            timeout: 300
            runas: ubuntu

    ```
1. <span style="color:teal"> buildspec.yaml </span>

    `buildspec.yml`

    ```
    version: 0.1

    # environment_variables:
    # plaintext:
    #   DJANGO_SETTINGS_MODULE: config.settings.test
    #   SECRET_KEY: nosecret
    #   DATABASE_DEFAULT_URL: sqlite:///db1.sqlite3
    #   DATABASE_STREAMDATA_URL: sqlite:///db2.sqlite3
    #   STREAM_INCOMING_PRIVATE_KEY: changeme
    #   STREAM_INCOMING_PUBLIC_KEY: changeme
    #   GOOGLE_API_KEY: changeme
    #   OPBEAT_ENABLED: False

    phases:
    pre_build:
        commands:
        - echo Prebuild ops
        - pip3 install -r requirements.txt
    build:
        commands:
        - echo Building the application 
    post_build:
        commands:
        - echo Build completed on `date`
    artifacts:
    files:
        - '**/*'

    ```
1. <span style="color:teal"> Scripts </span>
    1. <span style="color:teal"> nginx </span>
    1. <span style="color:teal"> Gunicon </span>
    1. <span style="color:teal"> python dependencies </span>
    1. <span style="color:teal"> startup </span>
    1. <span style="color:teal"> Clean instance </span>
    1. <span style="color:teal"> Stop</span>
    
## 4. Creating <span style="color:olive" >CodePipeline </span> 