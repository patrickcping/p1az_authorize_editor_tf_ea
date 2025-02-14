resource "pingone_authorize_trust_framework_attribute" "tutorial" {
  environment_id = var.pingone_environment_id
  name           = "Tutorial: Manage API Access"
  description    = "Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_manage_api_access.html"

  parent = {
    id = var.attribute_early_access_parent_id
  }

  value_type = {
    type = "STRING"
  }
}

resource "pingone_population" "users" {
  environment_id = var.pingone_environment_id

  name        = format("%sAAM Tutorial Users", var.configuration_prefix)
  description = "Population for users used in AAM tutorials. Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_add_meme_game_users.html"

  lifecycle {
    # change the `prevent_destroy` parameter value to `true` to prevent this data carrying resource from being destroyed
    prevent_destroy = false
  }
}
