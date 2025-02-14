resource "pingone_authorize_trust_framework_attribute" "tutorial" {
  environment_id = var.pingone_environment_id
  name           = "Tutorial: Building your first dynamic authorization policy"
  description    = "Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_tutorial_building_your_first_dynamic_authorization_policy.html"

  parent = {
    id = var.attribute_early_access_parent_id
  }

  value_type = {
    type = "STRING"
  }
}