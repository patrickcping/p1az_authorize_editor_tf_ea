resource "pingone_authorize_trust_framework_attribute" "protect" {
  environment_id = var.pingone_environment_id
  name           = "PingOne Protect Example"
  description    = "An example attribute to hold the PingOne Protect configuration"

  parent = {
    id = var.attribute_early_access_parent_id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation" {
  environment_id = var.pingone_environment_id
  name           = "Risk Evaluation"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect.id
  }

  value_type = {
    type = "STRING"
  }
}
