data "pingone_authorize_trust_framework_attribute" "pingone_user_managed_entity" {
  environment_id = var.pingone_environment_id
  full_name      = "PingOne.User"
}

resource "pingone_authorize_trust_framework_attribute" "pingone_user_external_id" {
  environment_id = var.pingone_environment_id
  name           = "externalId"
  description    = "The external ID in PingOne"

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

    expression = "$.externalId"
    value_type = {
      type = "STRING"
    }
  }

  value_type = {
    type = "STRING"
  }
}