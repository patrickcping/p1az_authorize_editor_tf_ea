resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_update" {
  environment_id = var.pingone_environment_id
  name           = "Update"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation.id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_update_risk_id" {
  environment_id = var.pingone_environment_id
  name           = "Risk ID"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_update.id
  }

  value_type = {
    type = "STRING"
  }
}
