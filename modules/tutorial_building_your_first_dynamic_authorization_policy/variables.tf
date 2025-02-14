variable "pingone_environment_id" {
  type        = string
  description = "The PingOne environment ID that has the PingOne Authorize Editor API feature flag enabled"

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_environment_id))
    error_message = "The PingOne Environment ID must be a valid PingOne resource ID (UUID format)."
  }
}

variable "attribute_early_access_parent_id" {
  type        = string
  description = "The name of the attribute that will be used as the parent for the example Terraform resources used in Early Access/UAT."
}

variable "configuration_prefix" {
  type        = string
  description = "The prefix to use for the configuration resources"
  default     = ""
}