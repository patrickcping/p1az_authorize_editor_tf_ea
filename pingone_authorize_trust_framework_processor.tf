resource "pingone_authorize_trust_framework_processor" "ea_parent" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access"
  description    = "An example processor with no configuration, used as a parent for example Terraform resources used in Early Access/UAT."

  processor = {
    name = "Test parent processor"
    type = "JSON_PATH"

    expression = "$.data.item.parent"
    value_type = {
      type = "STRING"
    }
  }
}
