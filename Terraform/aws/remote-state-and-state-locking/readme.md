# remote state and state locking.
- `terraform.tfstate` file will be created when we execute the command `terraform apply`
- use of terraform state file are :
- - `Mapping Configuration` to Real World infrastructure
- -  `Tracking Metadata`, tracking dependencies to create and delete infrastructure in order.
- -  `Performance', can work with more than one cloud providers.
- - Terraform `state` allows the members of the team to `collaborate` with one another.
- - terraform state file is mostly created in the local machine in the directory where  configuration files resides.
- -  `state` file are store in 'amazons3' or 'terraform cloud'

## state locking 
- state locking is when 2 user trying to modify or update the a terraform infrastructure using same state file at same time, it will lock the state file until the operation is complete. ie at a time one terraform apply will be executed or else the terraform state files will be corrupted. Version control system like `github` `doesn't` support `state locking` hence multiple users can use the state file at the same time, which will result in conflicts and data loses in the same file.
if the user fails to work with the latest version of the state file and works with the older obsolete version of the state file which will results in disastrous effect such as rollback, destroying of the infrastructure.

-  so it's alway better to store the terraform state file in a secured shared storage by making use of remote state backends.
- no the state file will no longer resides in the state directory or SCM repository and are moved to a much secure shared storage service like
- - amazons3 
- - HashiCorp Consol,  
- - google cloud storage, 
- - terraform cloud


- Automatically Load and Upload `State` File -: when the remote backend is configured the terraform will automatically load `State` file form the shared storage every time it is required by a terraform operation, and also upload the terraform updated state file after every apply.
- many Backends Supports `State Locking` -: this ensure that the `integrity` of the `state` file maintain finally the backend provided different ways to secure the storage by encrypting.
- 
#

## we need a s3 bucket for storing the `state` file and a dynamodb for enabling the state locking.


# terraform state commands
- terraform state file is stored as a json file.
- `terraform state <subcommand> [options] [args]`

|Sub-command|
|-|
|list|
|mv|
|pull|
|rm|
|show|
1.  to `list` all of the resources with in the terraform state file.
- - it will only print the resources address
- - `terraform state list`
- -  `terraform state list <pass the address of a matching resource>` # if found it will returns the result.
2. to get a details information about the resource form a state file. 
 - - `terraform state show <pass the address of a matching resource>` to get details of a single resource 
 3. To move the item in a terraform state file. to move the resource in the same state file. that is moving a resource from the current address to another.
- - renaming the resource or moving the resource form one state to another state file maintained by different configuration file completely.
 - - `terraform state mv [option] SOURCE DESTINATION`
```
resource "aws_dynamodb_table" "state-locking"{
    name = "state-locking"
    hash_key = "LockID"
    attributes {
        name = "LockID"
        type = "S"
    }
}
```
``` 
"resource" : [
    {
        "mode": "managed",
        "type": "aws_dynamodb_table",
        "name": "state-locking",
        "provider": "provider[\"registry.terraform.io/hashicorp/aws]",
    }
]
```

- - one way to move/rename the above resource with out recreating it is -:
```
$ terraform state mv aws_dynamodb_table.state_locking aws_dynamodb_tab.state-locking-db
Move "aws_dynamodb_table.state_locking" to "aws_dynamodb_tab.state-locking-db"
Successfully moved 1 objects(s).
```

4. if out terraform state is stored in the backed "remote location". 

```
$ terraform state pull [options] SOURCE DESTINATION
```
- to view the state file of the current state which is stored in the remote location.

5.``` Terraform state rm ADDRESS``` it is used to delete item from the terraform state file.
- - if we wish to no longer one or more resources using the current terraform state file.
`$ terraform state rm <address>` 
- - the actual infrastructure will not be removed  while using the above command it will only remved for the current terraform state