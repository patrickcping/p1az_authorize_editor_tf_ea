module "pingone_protect" {
  source = "./modules/pingone_protect"

  pingone_environment_id           = var.pingone_authorize_environment_id
  attribute_early_access_parent_id = pingone_authorize_trust_framework_attribute.early_access_parent.id
  service_early_access_parent_id   = pingone_authorize_trust_framework_service.early_access_parent.id

  configuration_prefix = "P1Az Terraform Example - "
}