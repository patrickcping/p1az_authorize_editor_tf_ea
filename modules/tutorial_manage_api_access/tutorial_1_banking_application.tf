resource "pingone_resource" "banking_app" {
  environment_id = var.pingone_environment_id

  name        = format("%sBanking App", var.configuration_prefix)
  description = "Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_add_banking_app.html"

  access_token_validity_seconds = 3600
}

resource "pingone_resource_scope" "banking_app_banking_scope" {
  environment_id = var.pingone_environment_id
  resource_id    = pingone_resource.banking_app.id

  name        = "banking"
  description = "Access banking services. Managed by Terraform."
}

resource "pingone_application" "aam_banking_client" {
  environment_id = var.pingone_environment_id
  name           = format("%sAAM Tutorial Banking Client", var.configuration_prefix)
  description    = "Banking app for AAM tutorials. Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_add_banking_app.html"
  enabled        = true

  oidc_options = {
    type                       = "SINGLE_PAGE_APP"
    grant_types                = ["AUTHORIZATION_CODE", "CLIENT_CREDENTIALS"]
    response_types             = ["CODE"]
    pkce_enforcement           = "S256_REQUIRED"
    token_endpoint_auth_method = "CLIENT_SECRET_BASIC"
    redirect_uris              = ["https://oauth.pstmn.io/v1/callback"]
  }
}

resource "pingone_application_resource_grant" "aam_banking_client_grants" {
  environment_id = var.pingone_environment_id
  application_id = pingone_application.aam_banking_client.id

  resource_type      = "CUSTOM"
  custom_resource_id = pingone_resource.banking_app.id

  scopes = [
    pingone_resource_scope.banking_app_banking_scope.id
  ]
}