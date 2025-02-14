output "service_url" {
  value       = format("https://http-access-api.pingone.%s/v1/environments/%s", var.pingone_domain_suffix, var.pingone_environment_id)
  description = "The Service URL to configure in the API Gateway"
}

output "pingone_api_gateway_credential" {
  value       = pingone_gateway_credential.my_awesome_api_gateway.credential
  sensitive   = true
  description = "The Service URL to configure in the API Gateway"
}