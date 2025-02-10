variable "pingone_authorize_environment_id" {
  type        = string
  description = "The PingOne environment ID that has the PingOne Authorize Editor API feature flag enabled"

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_authorize_environment_id))
    error_message = "The PingOne Environment ID must be a valid PingOne resource ID (UUID format)."
  }
}

variable "pingone_worker_client_id" {
  type        = string
  description = "The PingOne worker application client ID to use to connect Terraform to PingOne"

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_worker_client_id))
    error_message = "The PingOne Environment ID must be a valid PingOne resource ID (UUID format)."
  }
}

variable "pingone_worker_client_secret" {
  type        = string
  description = "The PingOne worker application client secret to use to connect Terraform to PingOne"
}

variable "pingone_worker_environment_id" {
  type        = string
  description = "The PingOne environment ID that contains the worker application (with admin roles assigned) to use to connect Terraform to PingOne"

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_worker_environment_id))
    error_message = "The PingOne worker application Environment ID must be a valid PingOne resource ID (UUID format)."
  }
}

variable "pingone_tenant_region_code" {
  type        = string
  description = "The PingOne region to use, which selects the appropriate service endpoints. Options are `AP` (for Asia-Pacific `.asia` tenants), `AU` (for Asia-Pacific `.com.au` tenants), `CA` (for Canada `.ca` tenants), `EU` (for Europe `.eu` tenants) and `NA` (for North America `.com` tenants)."
}