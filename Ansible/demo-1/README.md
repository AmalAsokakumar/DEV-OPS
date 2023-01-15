`xml `
```
<servers>
    <server>
        <name>Server1</name>
        <owner>John</owner>
        <created>12232023</created>
        <status>active</status>
    </server>
</servers>
```

`JSON`
```
{
    servers:[
        {
            name: Server1,
            owner: John,
            created : 12232023
            status : active
        }
    ]
}
```
`yaml`
```
Servers:
    - name: Server1
      owner: John
      created: 12232023
      status: active
```
- array/list
```
Fruits:
 - orange
 - apple
 - banana

 Vegetables: 
 - carrot
 - cauliflower
 - tomato
 ```

 - Dictionary  : can either have a value or hash map 
 ```
 Banana:
    Calories: 105
    Fat: 0.4 g
    Carbs: 27 g

Grapes: 
    Calories: 62
    Fat: 0.3g
    Carbs: 16g
```

- list of dictionary 

 ```
 Fruits:
  -  Banana:
        Calories: 105
        Fat: 0.4 g
        Carbs: 27 g

  -  Grapes: 
        Calories: 62
        Fat: 0.3g
        Carbs: 16g
```
- list\array are ordered 
- dictionary are Unordered

ansible inventory - 
1. connecting to target machine through ssh
2. info about target machine is stored in the inventory file.
- it's default location is:

`/etc/ansible/hosts`

```
server1.company.com
server2.company.com

[mail] --> group
server3.company.com
server4.company.com

[db]
server5.company.com
server6.company.com


[usr]
server7.company.com
server8.company.com
```


- using alias to identify servers

```
web     ansible_host=server1.company.com
db      ansible_host=server2.company.com
mail    ansible_host=server3.company.com
web2    ansible_host=server4.company.com
```

<span style="color:green">ansible_host</span> is an inventory parameter is used to define `FQDN` or `IP` address of the server.

some other inventory parameters are
- <span style="color:green"> ansible_connection </span> -ssh/winrm/localhost
- <span style="color:green">ansible_port</span> -22/5986
- <span style="color:green"> ansible_user</span> -root/administrator
- <span style="color:green"> ansible_ssh_pass</span> - Password 

```
web     ansible_host=server1.company.com ansible_connection=ssh
db      ansible_host=server2.company.com ansible_connection=winrm
mail    ansible_host=server3.company.com ansible_connection=ssh
web2    ansible_host=server4.company.com ansible_connection=winrm

localhost ansible_connection=localhost  
```
## Ansible playbooks 

- to run a sequence of scrips in a number of targets 
- infra structure provisioning.
- hosts are set at play level. which should match with the server defined in the inventory at `/etc/ansible/hosts`. if you provide a group name the play will execute at group level

#

- `playbook` - A single yaml file.
    - `Play` - Defines a set of activities.
      (Tasks) to be run onf hosts
        - `Task` - An action to be performed on host
            -  Execute a command
            - Run a script
            - Install a package
            - Shutdown/Restart

#
`playbook.yaml`
```
- name: Play 1
  host: localhost    # host where we wanted to run the command.
  tasks:
    - name: Execute command 'date'
      command: date

    - name: Execute script on server
      script: test_script.sh
    
    - name: Install httpd service
      yum:
        name: httpd 
        state: latest
    
    - name: Start web server
        Service:
            name: httpd
            state: started
```
#

### The above playbook is split into two plays

```
-
  name: Play 1
  host: localhost    # host where we wanted to run the command.
  tasks:
    - name: Execute command 'date'
      command: date

    - name: Execute script on server
      script: test_script.sh
```

```
-
  name: Play2
  host: localhost
  tasks:
    - name: Install httpd service
      yum:
        name: httpd 
        state: latest
    
    - name: Start web server
        Service:
            name: httpd
            state: started

```
# ansible modules

1. service
2. yum 
3. command
4. script
5. shell

- Execute ansible playbook

```ansible-playbook  <playbook file name>```


## main classification of modules 

1. System
    - User
    - Group
    - Hostname
    - Iptables
    - Lvg
    - Lvol
    - Make
    - Mount
    - Ping
    - Timezone
    - Systemd
    - Service
2. Command
    - Command
    - Expect
    - Raw
    - Script
    - Shell
3. Files
    - Acl
    - Archive
    - Copy
    - File
    - Find
    - Lineinfile
    - Replace
    - State
    - Template
    - Unarchive
4. Database
    - Mongodb
    - Mssql
    - Mysql
    - Postgresql
    - Proxysql
    - Vertica
5. Cloud
    - Amazon
    - Atomic
    - Azure
    - Centrylink
    - Cloudscale
    - Digital Ocean
    - Docker
    - Google
    - Linode
    - Openstack
    - Rackspace
    - Smartos
    - Softlayer
    - VMware
6. Window
    - Win_copy
    - Win_command
    - Win_domain
    - Win_file
    - Win_lis_website
    - Win_msg
    - Win_msi
    - Win_package
    - Win_ping
    - Win_path
    - Win_robocopy
    - Win_regedit
    - Win_shell
    - Win_service
    - Win_user
    - AND more
7. More


## command modes are used to execute a command.

```
- name: display resolv.conf  contents
  command: cat /etc/resolv.conf

# these two commands produce the same output.

- name: display resolv.conf  contents
  command: cat resolv.conf chdir=/etc


- name: create a folder
  command: mkdir /folder  creates=/folder # only creates a folder if it doesn't exists

```
# two mode of writing

# manage service  - start stop restart, we can write the yaml script in this manner also

```
- 
    name: Start Services in order
    hosts: localhost
    tasks:
      - name: start the database service
        service : name=postgresql state=started
```
```
- 
    name: Start Services in order
    hosts: localhost
    tasks:
      - name: start the database service
        service : 
          name: postgresql 
          state: started

```

- why<span style="color:green"> "stared"</span>
  and not<span style="color:blue"> "start" </span>
 ?
    - to ensure the service httpd is started

    - if the httpd is not already started => start it
    - if the httpd is already started => do nothing
    - to attain idempotent 


### lineinfile - module, search for a line in a file and replace it or add it if it doesn't exist'

- eg, to add a new server information ot the /etc/resolv.conf


`/etc/resolv.conf` 
```
nameserver 10.1.145.2
nameserver 10.23.35.3
```
`playbook.yaml'
```
- 
    name: add dns server to resolv.conf
    host: localhost
    tasks: 
        - lineinfile:
            path: /etc/resolv.conf
            line: 'nameserver 10.23.43.5'
```

## variables

`inventory`

```
web1 ansible_host=server1.company.com ansible_connection=ssh ansible_ssh_pass=p@sswd 
```


```
- 
    name: add dns server to resolv.conf
    host: localhost
    tasks: 
    vars:
        dns_server: 10.1.250.10
        - lineinfile:
            path: /etc/resolv.conf
            line: 'nameserver 10.23.43.5'
```
or create a variables file

`variables`
```
variable1: value1
variable2: value2
```

## to use a variable  jinja2 Templating 

```
- 
    name: add dns server to resolv.conf
    host: localhost
    tasks: 
    vars:
        dns_server: 10.1.250.10
        - lineinfile:
            path: /etc/resolv.conf
            line: 'nameserver {{ dns_server }}'
```

## ansible conditions and loops 


