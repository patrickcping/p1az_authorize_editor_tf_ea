module "tutorial_manage_api_access" {
  source = "./modules/tutorial_manage_api_access"

  pingone_environment_id           = var.pingone_authorize_environment_id
  attribute_early_access_parent_id = pingone_authorize_trust_framework_attribute.early_access_parent.id

  configuration_prefix = "P1Az Terraform Example - "

  pingone_domain_suffix = module.pingone_utils.pingone_domain_suffix
}

output "tutorial_manage_api_access_service_url" {
  value       = module.tutorial_manage_api_access.service_url
  description = "The Service URL to configure in the API Gateway for the Controlling access to APIs managed by an API service tutorial"
}

output "tutorial_manage_api_access_pingone_api_gateway_credential" {
  value       = module.tutorial_manage_api_access.pingone_api_gateway_credential
  sensitive   = true
  description = "The Service URL to configure in the API Gateway for the Controlling access to APIs managed by an API service tutorial"
}