data "pingone_authorize_trust_framework_attribute" "pingone_user_id_managed_entity" {
  environment_id = var.pingone_environment_id
  full_name      = "PingOne.User.ID"
}

resource "pingone_authorize_trust_framework_service" "protect_service_type_create" {
  environment_id = var.pingone_environment_id
  name           = "PingOne Protect Create Evaluation"
  description    = "PingOne Protect Create Service with custom risk policy set"

  parent = {
    id = var.service_early_access_parent_id
  }

  service_type = "CONNECTOR"

  cache_settings = {
    ttl_seconds = 300
  }

  service_settings = {
    capability = "createRiskEvaluation"
    channel    = "AUTHORIZE"
    code       = "P1_RISK"

    input_mappings = [
      {
        type     = "ATTRIBUTE"
        property = "userId"
        value_ref = {
          id = data.pingone_authorize_trust_framework_attribute.pingone_user_id_managed_entity.id
        }
      },
      {
        type     = "ATTRIBUTE"
        property = "userType"
        value_ref = {
          id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create_user_type.id
        }
      },
      {
        type     = "ATTRIBUTE"
        property = "ipAddress"
        value_ref = {
          id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create_ip_address.id
        }
      },
      {
        type     = "ATTRIBUTE"
        property = "applicationId"
        value_ref = {
          id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create_application_id.id
        }
      },
      {
        type     = "ATTRIBUTE"
        property = "applicationName"
        value_ref = {
          id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create_application_name.id
        }
      },
      {
        type     = "ATTRIBUTE"
        property = "sessionId"
        value_ref = {
          id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create_session_id.id
        }
      },
      {
        type     = "ATTRIBUTE"
        property = "browserData"
        value_ref = {
          id = pingone_authorize_trust_framework_attribute.protect_risk_evaluation_create_browser_data.id
        }
      },
      {
        type     = "INPUT"
        property = "riskPolicySetId"
        value    = pingone_risk_policy.my_awesome_scores_risk_policy.id
      }
    ]

    maximum_concurrent_requests = 6
    maximum_requests_per_second = 10
    schema_version              = "1"
    timeout_milliseconds        = 2000
  }

  value_type = {
    type = "JSON"
  }
}

# resource "pingone_authorize_trust_framework_service" "protect_service_type_update" {
#   environment_id = var.pingone_environment_id
#   name           = "PingOne Protect Update Evaluation"
#   description    = "PingOne Protect Update Service with custom risk policy set"

#   parent = {
#     id = var.service_early_access_parent_id
#   }

#   service_type = "CONNECTOR"

#   cache_settings = {
#     ttl_seconds = 300
#   }

#   service_settings = {
#     capability = "updateRiskEvaluation"
#     channel    = "AUTHORIZE"
#     code       = "P1_RISK"

#     input_mappings = [
#       {
#         property = "completionStatus"
#         type     = "INPUT"
#         value    = "completed"
#       },
#       {
#         property = "riskId"
#         type     = "INPUT"
#         value    = "test"
#       },
#     ]

#     maximum_concurrent_requests = 6
#     maximum_requests_per_second = 10
#     schema_version              = "1"
#     timeout_milliseconds        = 2000
#   }

#   value_type = {
#     type = "JSON"
#   }
# }