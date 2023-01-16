# making everything which is needed by that server to do it's intended task

## msysql
- installing pre-requisites
- installing mysql packages
- configuring mysql service 
- configuring database and users


## nginx 
- installing pre-requisites
- installing nginx packages
- configuring nginx service
- configuring custom web pages


# roles

# we can package this entair steps into a singe file called role and use it when ever we want
```
- 
  name: Install and configure MySQL
  host: db-server
  tasks:
    - name: Installing Pre-requisites
      yum: name=pre-req-packages state=present

    - name: Install MySQL package
      yum: name=mysql state=present

    - name: Start MySQL Service
      service: name=mysql state=started
    
    - name: configure Database
      mysql_db: name=db1 state=present
```


- role example

```
# we can package this entair steps into a singe file called role and use it when ever we want

- 
  name: Install and configure MySQL
  host: db-server
  role: 
    - mysql
```

`MySQL-Role`
```
  tasks:
    - name: Installing Pre-requisites
      yum: name=pre-req-packages state=present

    - name: Install MySQL package
      yum: name=mysql state=present

    - name: Start MySQL Service
      service: name=mysql state=started
    
    - name: configure Database
      mysql_db: name=db1 state=present

```

## roles having a proper directory structure:


## directory 

- tasks
- vars
- defaults
- handlers
- templates

- find these playbooks in ansible galaxy

- use ansible galaxy to create the directory structure

```
 ansible-galaxy init mysql
 ```
- if we create a role in ansible it will by default look for the role in a directory called roles if it is not found there then it will look for a  path

`roles_path = /etc/ansible/roles`
usually this path is configured in the file `/etc/ansible/ansible.cnf`