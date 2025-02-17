resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts" {
  environment_id = var.pingone_environment_id
  name           = "User Posts API"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder.id
  }

  value_type = {
    type = "STRING"
  }
}