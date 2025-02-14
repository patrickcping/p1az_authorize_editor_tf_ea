# Ref: https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/schema_attribute#example-usage
resource "pingone_schema_attribute" "my_attribute" {
  environment_id = var.pingone_environment_id

  name         = "myAttribute"
  display_name = "My Awesome Attribute"
  description  = "Managed by Terraform. My new awesome attribute, added for the PingOne Authorize Terraform Early Access"

  type        = "STRING"
  unique      = false
  multivalued = false

  lifecycle {
    # change the `prevent_destroy` parameter value to `true` to prevent this data carrying resource from being destroyed
    prevent_destroy = false
  }
}
