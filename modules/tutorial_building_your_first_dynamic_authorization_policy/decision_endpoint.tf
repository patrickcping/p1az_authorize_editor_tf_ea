resource "pingone_authorize_decision_endpoint" "my_awesome_decision_endpoint" {
  environment_id = var.pingone_environment_id
  name           = "Awesome Decision Endpoint"
  description    = "Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_tutorial_policy_publishing_and_endpoint_configuration.html"

  record_recent_requests = true

#   authorization_version_id = // TODO
}

