resource "pingone_resource_scope" "meme_game_api_service_meme_game_scope" {
  environment_id = var.pingone_environment_id
  resource_id    = pingone_resource.meme_game_api_service.id

  name        = "meme-game"
  description = "Managed by Terraform."
}

resource "pingone_application" "meme_game" {
  environment_id = var.pingone_environment_id
  name           = format("%sMeme Game", var.configuration_prefix)
  description    = "Meme Game for AAM tutorials. Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_add_meme_game_application.html"
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

resource "pingone_application_resource_grant" "meme_game_app_meme_game_resource_grant" {
  environment_id = var.pingone_environment_id
  application_id = pingone_application.meme_game.id

  resource_type      = "CUSTOM"
  custom_resource_id = pingone_resource.meme_game_api_service.id

  scopes = [
    pingone_resource_scope.meme_game_api_service_meme_game_scope.id
  ]
}