// Utilities module
module "pingone_utils" {
  source = "pingidentity/utils/pingone"

  region_code    = var.pingone_tenant_region_code
  environment_id = var.pingone_authorize_environment_id
}

// Seed top level parent config in the Trust Framework and Policy Manager Library to clearly show example config
resource "pingone_authorize_trust_framework_attribute" "early_access_parent" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access"
  description    = "An example attribute with no configuration, used as a parent for example Terraform resources used in Early Access/UAT."

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_service" "early_access_parent" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access"
  description    = "An example service with no type, used as a parent service for example Terraform resources used in Early Access/UAT."

  service_type = "NONE"
}

resource "pingone_authorize_trust_framework_processor" "early_access_parent" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access"
  description    = "An example processor with no configuration, used as a parent for example Terraform resources used in Early Access/UAT."
}

resource "pingone_authorize_trust_framework_condition" "early_access_parent" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access"
  description    = "An example condition with no configuration, used as a parent for example Terraform resources used in Early Access/UAT."

  condition = {
    type = "EMPTY"
  }
}