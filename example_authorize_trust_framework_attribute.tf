resource "pingone_authorize_trust_framework_attribute" "current_user_id" {
  environment_id = var.pingone_authorize_environment_id
  name           = "Current User ID"
  description    = "The current user ID"

  parent = {
    id = pingone_authorize_trust_framework_attribute.early_access_parent.id
  }

  resolvers = [
    {
      type = "CURRENT_USER_ID"
    }
  ]

  value_type = {
    type = "STRING"
  }
}
