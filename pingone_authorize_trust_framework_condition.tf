resource "pingone_authorize_trust_framework_condition" "ea_parent" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access"
  description    = "An example condition with no configuration, used as a parent for example Terraform resources used in Early Access/UAT."

  condition = {
    type = "EMPTY"
  }
}