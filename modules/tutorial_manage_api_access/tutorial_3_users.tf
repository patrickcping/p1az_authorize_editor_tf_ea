resource "pingone_user" "genericuser" {
  environment_id = var.pingone_environment_id

  population_id = pingone_population.users.id

  username = "genericuser"
  email    = "genericuser@pingone.com" // tutorial says example.com, but we should use our own domains in case emails are sent
}

resource "pingone_user" "companyuser" {
  environment_id = var.pingone_environment_id

  population_id = pingone_population.users.id

  username = "companyuser"
  email    = "companyuser@pingidentity.com"
}