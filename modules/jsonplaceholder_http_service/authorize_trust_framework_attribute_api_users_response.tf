resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_response" {
  environment_id = var.pingone_environment_id
  name           = "Response"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts.id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_response_body" {
  environment_id = var.pingone_environment_id
  name           = "Body"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_response.id
  }

  resolvers = [
    {
      type = "SERVICE"
      value_ref = {
        id = pingone_authorize_trust_framework_service.http_type.id
      }
    },
  ]

  value_schema = jsonencode({
    "$schema" : "http://json-schema.org/draft-04/schema#",
    "type" : "array",
    "items" : {
      "type" : "object",
      "properties" : {
        "userId" : {
          "type" : "string",
          "displayName" : "User ID",
          "description" : "The user ID in the JSONSchema service that maps to the `externalId` in the PingOne user schema.",
          "schemaType" : "STANDARD"
        },
        "id" : {
          "type" : "string",
          "displayName" : "ID",
          "description" : "The post ID in the JSONSchema service.",
          "schemaType" : "STANDARD"
        },
        "title" : {
          "type" : "string",
          "displayName" : "Title",
          "description" : "The post title.",
          "schemaType" : "STANDARD"
        },
        "body" : {
          "type" : "string",
          "displayName" : "Body",
          "description" : "The post body.",
          "schemaType" : "STANDARD"
        }
      }
    }
  })

  value_type = {
    type = "JSON"
  }
}
