data "pingone_authorize_trust_framework_attribute" "pingone_user_managed_entity" {
  environment_id = var.pingone_environment_id
  full_name      = "PingOne.User"
}

resource "pingone_authorize_trust_framework_attribute" "my_attribute" {
  environment_id = var.pingone_environment_id
  name           = pingone_schema_attribute.my_attribute.name
  description    = pingone_schema_attribute.my_attribute.description

  parent = {
    id = data.pingone_authorize_trust_framework_attribute.pingone_user_managed_entity.id
  }

  resolvers = [
    {
      type = "ATTRIBUTE"
      value_ref = {
        id = data.pingone_authorize_trust_framework_attribute.pingone_user_managed_entity.id
      }
    }
  ]

  processor = {
    name = "JSON Path processor"
    type = "JSON_PATH"

    expression = format("$.%s", pingone_schema_attribute.my_attribute.name)
    value_type = {
      type = "STRING"
    }
  }

  value_type = {
    type = "STRING"
  }
}