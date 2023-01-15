# using the when condition 
```
- name: install Nginx
  hosts: all
  tasks: 
    - name: install Nginx on Debian
      apt:
          name: nginx
          state: present
      when: ansible_os_family == "Debian"

    -  name: install Nginx on Redhat
       yum:
          name: nginx
          state: present
       when: ansible_os_family == "RedHat"
```
# using 'or' and 'and'
```
- name: install Nginx
  hosts: all
  tasks: 
    - name: install Nginx on Debian
      apt:
          name: nginx
          state: present
      when: ansible_os_family == "Debian" and
      ansible_distribution_version == "16.04"


    -  name: install Nginx on Redhat
       yum:
          name: nginx
          state: present
       when: ansible_os_family == "RedHat" or
       ansible_os_family == "SUSE"
```

# loops

```
# using loops to install a list of packages

- name: Install nginx
  hosts: all 
  vars:
    packages:
      - name: nginx
        required: True
      - name: mysql
        required: True
      - name: apache
        required: False
  tasks:
    - name: Install "{{ item.name }}" on Debian
      apt:
        name: "{{ item.name }}"
        state: present
      when: item.required == True
      loop: "{{ packages }}"

```

# conditionals & Register

```
- name: check status of a service and email if it's down
  host: localhost
  tasks:
    - command: service http status
      register: result   # to store the result of the above command

    - mail:
      to: admin@company.com
      subject: service alert
      body: Httpd service is down
      when: result.stdout.find('down') != -1 # here we are checking the 'result' for a string "down" using the find command and the file content is fed to find command using stdout. The 'find' command will return the position of the sting if match found else return -1.

```
# passing a dictionary
## loop directive 

```
  name: Create users
  host: localhost
  task:
  - user: name="{{item.name}}" "{{ item.uid }}" state=present
    loop:   # this loop directive is newly added before we use this 'with_item' directive.
      - name: joe
        uid: 1010
      - name: george
        uid: 1011
      - name: ravi
        uid: 1012
      - name: ramu
        uid: 1013
      - name: rema 
        uid: 1014
      - name: renju 
        uid: 1015
      - name: remj
        uid: 1016
      - name: rani 
        uid: 1017
```
## with_items directive   often used in older playbooks
```
---
  name: Create users
  host: localhost
  task:
  - user: name="{{item.name}}" "{{ item.uid }}" state=present
    with_items:   
      - name: joe
        uid: 1010
      - name: george
        uid: 1011
      - name: ravi
        uid: 1012
      - name: ramu
        uid: 1013
      - name: rema 
        uid: 1014
      - name: renju 
        uid: 1015
      - name: remj
        uid: 1016
      - name: rani 
        uid: 1017
```

# other use case of with_*
- there are lot more with directives out there:
- everything we see <span style="color:yellow">with_</span> is a <span style="color:red">look_up plugin </span

1. <span style="color:yellow">with_files:</span>
2. <span style="color:yellow">with_url:</span>
3. <span style="color:yellow">with_mongodb:</span>
- what are <span style="color:grey">lookup plugins </span> - they are custom scripts used to connect with something.