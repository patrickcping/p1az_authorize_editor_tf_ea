resource "pingone_gateway" "my_awesome_api_gateway" {
  environment_id = var.pingone_environment_id

  name        = format("%sAwesome API Gateway", var.configuration_prefix)
  description = "Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_configure_kong_plugin.html"
  enabled     = true

  type = "API_GATEWAY_INTEGRATION"
}

resource "pingone_gateway_credential" "my_awesome_api_gateway" {
  environment_id = var.pingone_environment_id
  gateway_id     = pingone_gateway.my_awesome_api_gateway.id
}
