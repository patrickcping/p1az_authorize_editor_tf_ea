# Ref: https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/schema_attribute#example-usage
resource "pingone_schema_attribute" "my_attribute" {
  environment_id = var.pingone_environment_id

  name         = var.attribute.name
  display_name = var.attribute.display_name
  description  = var.attribute.description

  type        = var.attribute.type
  unique      = var.attribute.unique
  multivalued = var.attribute.multivalued

  lifecycle {
    # change the `prevent_destroy` parameter value to `true` to prevent this data carrying resource from being destroyed
    prevent_destroy = false
  }
}
