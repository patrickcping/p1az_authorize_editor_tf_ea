resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_request" {
  environment_id = var.pingone_environment_id
  name           = "Request"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts.id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_request_headers" {
  environment_id = var.pingone_environment_id
  name           = "Headers"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request.id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_request_headers_example" {
  environment_id = var.pingone_environment_id
  name           = "Example Header"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request_headers.id
  }

  resolvers = [
    {
      type  = "CONSTANT"
      value = "example"
      value_type = {
        type = "STRING"
      }
    }
  ]

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_request_auth" {
  environment_id = var.pingone_environment_id
  name           = "Auth"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request.id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_request_auth_basic" {
  environment_id = var.pingone_environment_id
  name           = "Basic"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request_auth.id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_request_auth_basic_username" {
  environment_id = var.pingone_environment_id
  name           = "Username"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request_auth_basic.id
  }

  resolvers = [
    {
      type  = "CONSTANT"
      value = "dummyusername"
      value_type = {
        type = "STRING"
      }
    }
  ]

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "jsonplaceholder_api_user_posts_request_auth_basic_password" {
  environment_id = var.pingone_environment_id
  name           = "Password"

  parent = {
    id = pingone_authorize_trust_framework_attribute.jsonplaceholder_api_user_posts_request_auth_basic.id
  }

  resolvers = [
    {
      type  = "CONSTANT"
      value = "dummypassword"
      value_type = {
        type = "STRING"
      }
    }
  ]

  value_type = {
    type = "STRING"
  }
}
