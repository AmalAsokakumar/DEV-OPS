# MODULES FROM REGISTRY.

1. To use a module from the Terraform Registry in your Terraform configuration, you can use the module block and specify the source of the module as the URL of the module on the Terraform Registry. Here is an example of how to use the module block to import a module from the Terraform Registry:

```
module "example" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.43.0"

    # Additional module arguments here
}
```
- source attribute is used to specify the source of the module, in this case, it is the URL of the module on the Terraform Registry.
version attribute is used to specify the version of the module that you want to use.
You can also specify the source of the module as a local file path if you have downloaded the module files and saved them locally.

- You can also use terraform get command to download the modules that are referenced in your configurations, it will download the modules to the .terraform directory.

```
terraform get
```
- Once you have specified the source and version of the module, you can use it in your Terraform configuration by referencing its resources and variables.


## terraform registry

- - verified modules 

- - community module