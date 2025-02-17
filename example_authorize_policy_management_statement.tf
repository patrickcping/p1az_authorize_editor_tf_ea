resource "pingone_authorize_policy_management_statement" "early_access_example" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Terraform Early Access Example"
  description    = "An example statement with minimal configuration, used in Early Access/UAT."

  code = "my statement 1"

  applies_to = "DENY"
  applies_if = "PATH_MATCHES"

  payload = jsonencode({
    "foo" : "bar",
    "foo2" : "bar2"
  })

  attributes = [
    {
      id = pingone_authorize_trust_framework_attribute.current_user_id.id
    },
  ]
}