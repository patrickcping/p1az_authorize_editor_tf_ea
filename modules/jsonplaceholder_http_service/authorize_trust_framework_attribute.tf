resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder" {
  environment_id = var.pingone_environment_id
  name           = "JSONPlaceholder API Example"
  description    = "An example attribute to hold the JSONPlaceholder API configuration"

  parent = {
    id = var.attribute_early_access_parent_id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_hostname" {
  environment_id = var.pingone_environment_id
  name           = "Hostname"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder.id
  }

  resolvers = [
    {
      type  = "CONSTANT"
      value = "jsonplaceholder.typicode.com"
      value_type = {
        type = "STRING"
      }
    }
  ]

  value_type = {
    type = "STRING"
  }
}