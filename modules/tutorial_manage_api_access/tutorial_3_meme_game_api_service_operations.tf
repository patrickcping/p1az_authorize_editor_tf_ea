resource "pingone_authorize_api_service_operation" "meme_game_api_service_start_new_game" {
  environment_id = var.pingone_environment_id
  api_service_id = pingone_authorize_api_service.meme_game_api_service.id

  name = "Start a new game"

  methods = [
    "POST",
  ]

  paths = [
    {
      pattern = "/api/v1/games"
      type    = "EXACT"
    },
  ]
}
