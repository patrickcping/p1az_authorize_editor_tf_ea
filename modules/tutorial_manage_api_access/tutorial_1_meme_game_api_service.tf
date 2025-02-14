resource "pingone_resource" "meme_game_api_service" {
  environment_id = var.pingone_environment_id

  name        = format("%sMeme Game", var.configuration_prefix)
  description = "Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_add_meme_game_service.html"

  audience                      = format("%sMeme Game", var.configuration_prefix)
  access_token_validity_seconds = 3600
}

resource "pingone_authorize_api_service" "meme_game_api_service" {
  environment_id = var.pingone_environment_id

  name = format("%sMeme Game", var.configuration_prefix)

  base_urls = [
    "https://localhost:8443/meme-game"
  ]

  authorization_server = {
    resource_id = pingone_resource.meme_game_api_service.id
    type        = "PINGONE_SSO"
  }

  directory = {
    type = "PINGONE_SSO"
  }

  access_control = {
    custom = {
      enabled = true
    }
  }
}

resource "pingone_authorize_api_service_deployment" "meme_game_api_service" {
  environment_id = var.pingone_environment_id
  api_service_id = pingone_authorize_api_service.meme_game_api_service.id
}