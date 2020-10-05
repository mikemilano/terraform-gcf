# GCP Cloud Functions with Terraform & Github

Create and maintain GCP Cloud functions from a Github repository with
Terraform and GCP Cloud Source.

Terraform is used to create the cloud functions while code updates are
automated through a synchronized Cloud Source repository.

There is a bit of GCP setup involved but once complete you can create
new functions with `terraform apply` and update function code with `git push`.

## Setup

### 1. Create a new GCP Project

Create a new GCP project and assure that billing is configured and
the following APIs are enabled:
- `apigateway`
- `cloudbuild`
- `cloudfunctions`
- `cloudresourcemanager`
- `iam`

### 2. Create a Service Account

- Go to IAM -> Service Accounts and create a new account with the
`Project -> Edit` role.
- Create a service key and save the json file to a path referenced in `variables.tf`

## 3. Create/Configure Repository

Create a new Cloud Source Repository.

You can [Mirror](https://cloud.google.com/source-repositories/docs/mirroring-a-github-repository
) it if you prefer to work in a Github or Bitbucket repo.

> Note: If mirroring Github, the default branch is now `main` while Cloud Source defaults to `master`.

## 4. Set Variables
Open `variables.tf` and update it with data relevant to your project.

## Usage

```
cd terraform

# Initialize project
terraform init

# Validate scripts
terraform validate

# See what terraform is going install
terraform plan

# Create Cloud Functions
terraform apply
```

## Adding Functions

- Add function code in the `src` directory
- Define a new `google_cloudfunctions_function` resource in `functions.tf`

> terraform.tfstate and .terraform are created when running terraform commands. They are ignored
> in this repo but you should research what is appropriate for your project. 
> See [Backends](https://www.terraform.io/docs/backends/) for other options.
