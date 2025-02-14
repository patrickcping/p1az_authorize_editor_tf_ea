resource "pingone_authorize_trust_framework_attribute" "amount" {
  environment_id = var.pingone_environment_id
  name           = "Amount"
  description    = "Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_tutorial_adding_an_attribute.html"

  parent = {
    id = pingone_authorize_trust_framework_attribute.tutorial.id
  }

  resolvers = [
    {
      type = "REQUEST"
    }
  ]

  value_type = {
    type = "NUMBER"
  }
}
