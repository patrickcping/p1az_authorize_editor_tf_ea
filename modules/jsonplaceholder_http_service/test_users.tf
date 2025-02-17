resource "pingone_population" "users" {
  environment_id = var.pingone_environment_id

  name        = format("%sJSONPlaceholder Users", var.configuration_prefix)
  description = "Population for users used in the JSONPlaceholder demo config. Managed by Terraform."

  lifecycle {
    # change the `prevent_destroy` parameter value to `true` to prevent this data carrying resource from being destroyed
    prevent_destroy = false
  }
}

resource "pingone_user" "test_user" {
  count = 10

  environment_id = var.pingone_environment_id

  population_id = pingone_population.users.id

  username = format("jsonplaceholder_user_%s", count.index + 1)
  email    = format("jsonplaceholder_user_%s@pingidentity.com", count.index + 1)

  external_id = count.index + 1
}