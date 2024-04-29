# Terraform CICD

## Introduction

This project is a simple example of how to use Terraform to create a CI/CD pipeline in AWS. The pipeline will be triggered by a push to a GitHub repository, and will deploy a simple web application to an EC2 instance.

## Prerequisites

- [An AWS account](https://portal.aws.amazon.com/billing/signup?p=free&c=hp&z=1#/start/email)
- [A GitHub account](https://docs.github.com/en/get-started/start-your-journey/creating-an-account-on-github)
- [Git installed on your local machine](https://github.com/git-guides/install-git)
- AWS CLI installed on your local machine
  - Mac: [Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
  - Windows: [Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
  - Linux: [Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions)
- [Terraform installed on your local machine](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Getting Started

Repository Setup

1. Create a new GitHub repository
1. Clone this repository to your local machine
1. run the cmd `rm -rf .git` to remove the git history
1. run the cmd `git init` to initialize a new git repository
1. run the cmd `git add .` to add all files to the git repository
1. run the cmd `git commit -m "initial commit"` to commit the files
1. run the cmd `git remote add origin https://your-repo-url-here` to add the new repository as the remote origin
1. DO NOT push the code to the remote repository yet as the remote state resources have not been created

AWS Resources for Remote State

1. Cd Into the local directory
1. Set the following variables in the `main.tf` file in the `local` folder:

```
region          = "your-region"
bucket_name     = "your-bucket-name"
bucket_tag_name = "your-bucket-tag-name"
table_name      = "your-table-name"
table_tag_name  = "your-table-tag-name"
```

1. Run `terraform init` to initialize the Terraform configuration
1. Run `terraform apply -auto-approve` to create the remote state resources in AWS

GitHub Secrets

1. In the GitHub repository, go to Settings > Secrets
1. Add the following secrets:

```
AWS_ACCESS_KEY_ID     = "your-access-key-id"
AWS_SECRET_ACCESS_KEY = "your-secret
```

Configuring Env Folders

In the main.tf of each environment folder, set your backend configuration:

```
hcl
terraform {
  backend "s3" {
    bucket         = "your-bucket-name"
    key            = "your-env-specific-key-name"
    region         = "your-region"
    dynamodb_table = "your-table-name"
  }
}
```
1. Run `terraform init` to initialize the Terraform configuration with backend configuration


## Deployment Workflow

1. The production.yml workflow will be triggered by a push to the master branch or pull request to the master branch
1. The staging.yml workflow will be triggered by a push to the staging branch or pull request to the staging branch
1. 
1. The workflow will:
   1. Checkout the code
   1. Install Terraform
   1. Initialize the Terraform configuration
   1. Plan the Terraform configuration
   1. Apply the Terraform configuration on merge to specific branches

Its best practice to create a new branch for each feature or bug fix and create a pull request to the staging branch. Once the pull request is approved and merged, the staging.yml workflow will be triggered. Once the staging environment deployment is successful, create a pull request to the from the staging branch to the master branch. This will make sure that production is up to date with the staging environment env though no changes were made to the production environment. Once that pull request succeeds, you should now implement the changes to the production environment by adding terraform code to the production environment folder. Once complete, create a pull request to the master branch and, the production.yml workflow will be triggered and on the merge of that branch the changes will be applied to the production environment.

