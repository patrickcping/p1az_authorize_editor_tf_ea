data "pingone_authorize_trust_framework_attribute" "pingone_api_access_management_http_request_body" {
  environment_id = var.pingone_environment_id
  full_name      = "PingOne.API Access Management.HTTP.Request.Body"
}

resource "pingone_authorize_trust_framework_attribute" "new_game_invitee_list" {
  environment_id = var.pingone_environment_id
  name           = "New game invitee list"
  description    = "Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_add_invitee_list_attribute.html"

  parent = {
    id = pingone_authorize_trust_framework_attribute.tutorial.id
  }

  resolvers = [
    {
      type = "ATTRIBUTE"
      value_ref = {
        id = data.pingone_authorize_trust_framework_attribute.pingone_api_access_management_http_request_body.id
      }
    }
  ]

  processor = {
    name = "JSON Path"
    type = "JSON_PATH"

    expression = "$.data.attributes.invitees"
    value_type = {
      type = "COLLECTION"
    }
  }

  default_value = "[]"

  value_type = {
    type = "COLLECTION"
  }
}
