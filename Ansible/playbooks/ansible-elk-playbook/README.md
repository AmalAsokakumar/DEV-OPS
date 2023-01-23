# Ansible ELK Playbook
 
This playbook is for setting up version 5.x of the ELK Stack on a remote server. 

## Notes and requirements

 - The playbook was built and tested on Ubuntu 16.04 VMs, for ELK versions 5.x 
 - You will need Ansible installed and running
 - Playbook is currently configured to set up the ELK stack together with Metricbeat for server perf monitoring. There is a role for Filebeat as well. You just need to add the Filebeat role to your [site.yml] file.
 
 ## Instructions
 
 1. Edit your Ansible hosts file ('/etc/ansible/hosts') and add an 'elkservers' entry for the server you wish to install ELK on. You can of course name the host any way you want, this is just an example. 
 2. Verify connectivity to the ELK server.
 3. In the terminal on the machine hosting Ansible, clone this repo.
 4. Cd into the directory, and run:
 `ansible-playbook site.yml`
 
 The plays in the playbook will run on the target server, installing ELK and the specified beats shippers. 
 
[site.yml]: https://github.com/DanielBerman/ansible-elk-playbook/blob/master/site.yml


## Ansible Galaxy is a tool provided by Ansible for managing and sharing Ansible roles. Here are a few common Ansible Galaxy commands:

1. ansible-galaxy init: Initialize a new Ansible role in the current directory.
2. ansible-galaxy list: List all the installed roles on the local system.
3. ansible-galaxy search: Search for roles on Ansible Galaxy by keyword or author.
4. ansible-galaxy install: Install a role from Ansible Galaxy.
5. ansible-galaxy remove: Remove an installed role from the local system.
6. ansible-galaxy import: Import a role from an existing archive or a source control management system.
7. ansible-galaxy export: Export a role to an archive or to a source control management system.
8. ansible-galaxy build: Build an Ansible role and create a distributable archive.
9. ansible-galaxy info: Display detailed information about a role, including dependencies and versions.
10. Please note that, You should have ansible installed before using these commands.







`ansible`: The base command for running Ansible commands. It can be used to run individual ad-hoc commands on specific host or group of hosts. It takes the following format:

```
ansible <host or group> -m <module> -a <arguments>
```
`ansible-playbook`: The command for running an Ansible playbook, which is a file containing a set of instructions for Ansible to execute. The format is:

```
ansible-playbook <playbook.yml> -i <inventory file>
```
`ansible-config`: This command allows you to show and set Ansible configuration settings. You can use it to view the current settings, or to modify them by passing in the desired new value. For example:

```
ansible-config view <setting>
ansible-config set <setting> <value>
```
`ansible-console`: This command allows you to start an interactive Ansible console, where you can run ad-hoc commands and interact with the Ansible API.

`ansible-doc`: This command allows you to display documentation for Ansible modules. You can use it to view the documentation for a specific module by passing the module name as an argument.

```
ansible-doc <module name>
```
`ansible-galaxy`: This command is used to manage roles from Ansible Galaxy. You can use it to search, install, remove, build, and export roles.

`ansible-inventory`: This command allows you to create or display Ansible inventory. You can use it to view the current inventory, or to create a new inventory file by passing in the desired file path and options.

`ansible-pull`: This command pulls playbooks from a source repository, automatically updating the local copy of the playbook, and then runs the playbook against the localhost.

`ansible-vault`: This command allows you to create, edit, and encrypt Ansible data files. You can use it to create new encrypted files, or to edit existing files by passing the file path and options.

.


