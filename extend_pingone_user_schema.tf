module "extend_pingone_user_schema" {
  source = "./modules/extend_pingone_user_schema"

  pingone_environment_id = var.pingone_authorize_environment_id
}