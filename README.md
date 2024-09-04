# Udacity Azure Dev-Ops Projet 1

This is a project related to Udacity Azure DevOps nanodegree.
It aims at deploying a policy, an image from a Packer template that will be used by Terraform.

## Dependencies

- An Azure account
- Packer
- Terraform

## Deploy

### Export the variable

Add to your .bashrc (or .zshrc) file:

```
export ARM_CLIENT_ID=""
export ARM_CLIENT_SECRET=""
export ARM_TENANT_ID=""
export ARM_SUBSCRIPTION_ID=""
```
save .bashrc file

Reload file bashrc
source .bashrc

### Deploy the policy

Create a policy that ensures all indexed resources are tagged. And apply the 'tagging-policy' definition to Azure subscription.

$ az policy definition create --name TaggingPolicy --rules policy.json

### Deploy the Packer image

$ packer build packer/server.json

### Prepare with Terraform

```
$ cd terraform/azure_resources
$ terraform init
$ terraform plan -var-file ../enviroments/dev.tfvars -out solution.plan
```

### Deploy with Terraform

```
$ cd terraform/azure_resources
$ terraform apply -var-file ../enviroments/dev.tfvars
```

## After

Destroy the infrastructure with:

```
$ cd terraform/azure_resources
$ terraform deploy -var-file ../enviroments/dev.tfvars
```

## Modify

The file `enviroments/dev.tfvars` contains all the variables used inside the `azure_resources/main.tf`. If you want to personnalize the code, it is likely those values you want to modify first.
