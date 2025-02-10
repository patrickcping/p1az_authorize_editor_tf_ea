resource "pingone_authorize_trust_framework_service" "ea_parent" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access"
  description    = "An example service with no type, used as a parent service for example Terraform resources used in Early Access/UAT."

  service_type = "NONE"
}

