resource "pingone_authorize_trust_framework_service" "http_type" {
  environment_id = var.pingone_environment_id
  name           = "JSONPlaceholder User Posts"
  description    = "An example HTTP service, using the JSONPlaceholder fake data API.  The auth creds are not real and are configured as an example."

  parent = {
    id = var.service_early_access_parent_id
  }

  service_type = "HTTP"

  cache_settings = {
    ttl_seconds = 300
  }

  processor = {
    expression = format("$[?(@.userId == {{%s}})]", pingone_authorize_trust_framework_attribute.pingone_user_external_id.id)
    name       = "Filter by external user ID"
    type       = "JSON_PATH"
    value_type = {
      type = "JSON"
    }
  }

  service_settings = {
    authentication = {
      type = "BASIC"

      name = {
        id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request_auth_basic_username.id
      }

      password = {
        id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request_auth_basic_password.id
      }
    }

    headers = [
      {
        key = "my_custom_header",
        value = {
          type  = "CONSTANT"
          value = "my_custom_value"
        }
      },
      {
        key = "my_custom_header2",
        value = {
          type = "ATTRIBUTE"
          attribute = {
            id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request_headers_example.id
          }
        }
      }
    ]

    maximum_concurrent_requests = 6
    maximum_requests_per_second = 10
    timeout_milliseconds        = 2000

    tls_settings = {
      tls_validation_type = "DEFAULT"
    }

    url  = format("https://{{%s}}/posts", pingone_authorize_trust_framework_attribute.jsonplaceholder_hostname.id)
    verb = "GET"
  }

  value_type = {
    type = "JSON"
  }
}
