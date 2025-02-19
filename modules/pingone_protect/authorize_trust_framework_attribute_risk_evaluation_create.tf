
resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_create" {
  environment_id = var.pingone_environment_id
  name           = "Create"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation.id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_create_user_type" {
  environment_id = var.pingone_environment_id
  name           = "User Type"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create.id
  }

  resolvers = [
    {
      type = "REQUEST"
    },
  ]

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_create_ip_address" {
  environment_id = var.pingone_environment_id
  name           = "IP Address"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create.id
  }

  resolvers = [
    {
      type = "REQUEST"
    },
  ]

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_create_application_id" {
  environment_id = var.pingone_environment_id
  name           = "Application ID"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create.id
  }

  resolvers = [
    {
      type = "REQUEST"
    },
  ]

  default_value = ""

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_create_application_name" {
  environment_id = var.pingone_environment_id
  name           = "Application Name"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create.id
  }

  resolvers = [
    {
      type = "REQUEST"
    },
  ]

  default_value = ""

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_create_session_id" {
  environment_id = var.pingone_environment_id
  name           = "Session ID"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create.id
  }

  resolvers = [
    {
      type = "REQUEST"
    },
  ]

  default_value = ""

  value_type = {
    type = "STRING"
  }
}

resource "pingone_authorize_trust_framework_attribute" "protect_risk_evaluation_create_browser_data" {
  environment_id = var.pingone_environment_id
  name           = "Browser Data"

  parent = {
    id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create.id
  }

  resolvers = [
    {
      type = "REQUEST"
    },
  ]

  default_value = ""

  value_type = {
    type = "STRING"
  }
}
