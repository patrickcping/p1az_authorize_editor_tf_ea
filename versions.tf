terraform {
  required_version = ">= 1.4.0, < 2.0.0"

  required_providers {
    # Uncomment the following lines if you are using the DaVinci Terraform provider.
    # davinci = {
    #   source = "pingidentity/davinci"
    #   version = ">= 0.4.9, < 1.0.0"
    # }

    # Uncomment the following lines if you are using the PingFederate Terraform provider.
    # pingfederate = {
    #   source = "pingidentity/pingfederate"
    #   version = ">= 1.4.2, < 2.0.0"
    # }

    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 1.4.0, < 2.0.0"
    }
  }
}

# Uncomment the following lines if you are using the DaVinci Terraform provider.
# provider "davinci" {
#   # Configuration options
#   # See https://registry.terraform.io/providers/pingidentity/davinci/latest/docs for more information
# }

# Uncomment the following lines if you are using the PingFederate Terraform provider.
# provider "pingfederate" {
#   # Configuration options
#   # See https://registry.terraform.io/providers/pingidentity/pingfederate/latest/docs for more information
# }

provider "pingone" {
  # Configuration options
  # See https://registry.terraform.io/providers/pingidentity/pingone/latest/docs for more information

  client_id      = var.pingone_worker_client_id
  client_secret  = var.pingone_worker_client_secret
  environment_id = var.pingone_worker_environment_id
  region_code    = var.pingone_tenant_region_code

  global_options {
    population {
      // This option should not be used in environments that contain production data.  Data loss may occur.
      // More information can be found at https://registry.terraform.io/providers/pingidentity/pingone/latest/docs#contains_users_force_delete-3
      contains_users_force_delete = false
    }
  }
}
