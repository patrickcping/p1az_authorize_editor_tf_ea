resource "pingone_authorize_api_service_operation" "meme_game_api_service_memes_of_another_user" {
  environment_id = var.pingone_environment_id
  api_service_id = pingone_authorize_api_service.meme_game_api_service.id

  name = "Get memes of another user"

  methods = [
    "GET",
  ]

  paths = [
    {
      pattern = "/api/v1/users/*/answers"
      type    = "EXACT"
    },
  ]

  access_control = {
    group = {
      groups = [
        {
          id = pingone_group.meme_game_admins.id
        }
      ]
    }
  }
}
