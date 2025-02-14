module "pingone_utils" {
  source = "pingidentity/utils/pingone"

  region_code    = var.pingone_tenant_region_code
  environment_id = var.pingone_authorize_environment_id
}