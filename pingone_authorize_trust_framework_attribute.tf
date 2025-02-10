resource "pingone_authorize_trust_framework_attribute" "ea_parent" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access"
  description    = "An example attribute with no configuration, used as a parent for example Terraform resources used in Early Access/UAT."

  value_type = {
    type = "STRING"
  }
}