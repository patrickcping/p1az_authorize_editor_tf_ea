# PingOne Authorize Policy Manager and Trust Framework Terraform Early Access

> [!NOTE]
> This repository contains pre-release Terraform HCL used to support closed early access activity.  Please review the released [Terraform provider documentation](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs) for the latest GA capability.

## Getting Started

Install Terraform on your machine, following the instructions [here](https://developer.hashicorp.com/terraform/install).

## Configure PingOne for Terraform access

If not done so already, first configure your PingOne organization for Terraform access by following the instructions at the [PingOne Terraform provider Getting Started Guide](https://pingidentity.github.io/terraform-docs/getting-started/pingone/#configure-pingone-for-terraform-access).

## Setting up the Project

### Variables
After cloning the project, in an IDE (code editor) create a file named `terraform.tfvars` using the `terraform.tfvars.example` as an example.  Ensure the file contains the following name/value pairs. You replace the values in double braces.

```hcl
pingone_authorize_environment_id = "{{environment id}}"
pingone_tenant_region_code       = "{{ NA | CA | AP | AU | EU }}"
pingone_worker_client_id         = "{{worker application client id}}"
pingone_worker_client_secret     = "{{worker application client secret}}"
pingone_worker_environment_id    = "{{worker application environment id}}"
```

### Deployment

In the command line, from the project root, run:

```zsh
terraform init -upgrade
terraform plan -out tfplan
```

If the plan fails - check your `terraform.tfvars` values.

If the plan succeeds:

```zsh
terraform apply "tfplan"
```

If this is successful, you will see PingOne Authorize configuration added to the target environment configured as the `pingone_authorize_environment_id` variable.

## Terraform Variables

The following sections describe the available Terraform variables that can be modified to customise the deployment.

### Terraform variables

| Variable Reference                                        | Description                                                                                                                                                               | Type   | Default Value      |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | ------------------ |
| `pingone_authorize_environment_id` | The PingOne environment ID that has the PingOne Authorize Editor API feature flag enabled. | string (UUID format) | *No default value* |
| `pingone_tenant_region_code` | The PingOne region to use, which selects the appropriate service endpoints. Options are `AP` (for Asia-Pacific `.asia` tenants), `AU` (for Asia-Pacific `.com.au` tenants), `CA` (for Canada `.ca` tenants), `EU` (for Europe `.eu` tenants) and `NA` (for North America `.com` tenants). | string | *No default value* |
| `pingone_worker_client_id` | The PingOne worker application client ID to use to connect Terraform to PingOne. | string (UUID format) | *No default value* |
| `pingone_worker_client_secret` | The PingOne worker application client secret to use to connect Terraform to PingOne. | string | *No default value* |
| `pingone_worker_environment_id` | The PingOne environment ID that contains the worker application (with admin roles assigned) to use to connect Terraform to PingOne. | string (UUID format) | *No default value* |

## Terraform Outputs

| Output Reference                                 | Description |
| ------------------------------------------------ | ------- |
| `tbc` | TBC |
