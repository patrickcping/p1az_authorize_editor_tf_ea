module "tutorial_building_your_first_dynamic_authorization_policy" {
  source = "./modules/tutorial_building_your_first_dynamic_authorization_policy"

  pingone_environment_id           = var.pingone_authorize_environment_id
  attribute_early_access_parent_id = pingone_authorize_trust_framework_attribute.early_access_parent.id
}