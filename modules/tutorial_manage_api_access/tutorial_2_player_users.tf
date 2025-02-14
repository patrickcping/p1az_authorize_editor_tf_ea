resource "pingone_user" "gameplayer" {
  environment_id = var.pingone_environment_id

  population_id = pingone_population.users.id

  username = "gameplayer"
  email    = "gameplayer@pingidentity.com"
}

resource "pingone_user" "gameadmin" {
  environment_id = var.pingone_environment_id

  population_id = pingone_population.users.id

  username = "gameadmin"
  email    = "gameadmin@pingidentity.com"
}

resource "pingone_group" "meme_game_admins" {
  environment_id = var.pingone_environment_id

  name        = format("%sMeme Game Admins", var.configuration_prefix)
  description = "Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_add_meme_game_users.html"

  lifecycle {
    # change the `prevent_destroy` parameter value to `true` to prevent this data carrying resource from being destroyed
    prevent_destroy = false
  }
}

resource "pingone_user_group_assignment" "meme_game_admin_to_meme_game_admins_group" {
  environment_id = var.pingone_environment_id

  user_id  = pingone_user.gameadmin.id
  group_id = pingone_group.meme_game_admins.id
}