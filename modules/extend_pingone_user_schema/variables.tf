variable "pingone_environment_id" {
  type        = string
  description = "The PingOne environment ID that has the PingOne Authorize Editor API feature flag enabled"

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_environment_id))
    error_message = "The PingOne Environment ID must be a valid PingOne resource ID (UUID format)."
  }
}

variable "attribute" {
  type = object({
    name         = string
    display_name = optional(string)
    description  = optional(string)
    type         = optional(string)
    unique       = optional(bool)
    multivalued  = optional(bool)
  })
  description = "The name of the attribute to create in the PingOne environment"

  default = {
    name         = "myAttribute"
    display_name = "My Awesome Attribute"
    description  = "Managed by Terraform. My new awesome attribute, added for the PingOne Authorize Terraform Early Access"
    type         = "STRING"
    unique       = false
    multivalued  = false
  }
}
