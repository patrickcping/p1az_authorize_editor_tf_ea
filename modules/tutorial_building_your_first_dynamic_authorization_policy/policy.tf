resource "pingone_authorize_policy_management_policy" "payment_checks" {
  environment_id = var.pingone_environment_id
  name           = format("%sPayment checks", var.configuration_prefix)
  description    = "Managed by Terraform. Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_tutorial_adding_and_testing_policies.html"

  enabled = true

  combining_algorithm = {
    algorithm = "FIRST_APPLICABLE"
  }

  // TODO: Rules open issue
  #   children = [
  #     {
  #       name = "Permit payments up to 10000 USD"
  #       type = "RULE"

  #       enabled = true

  #       condition = {
  #         type = "AND"
  #         conditions = [
  #           {
  #             type = "COMPARISON",
  #             left = {
  #               type = "ATTRIBUTE",
  #               id   = pingone_authorize_trust_framework_attribute.amount.id
  #             },
  #             comparator = "LESS_THAN",
  #             right = {
  #               type  = "CONSTANT",
  #               value = "10000"
  #             }
  #           }
  #         ]
  #       }

  #       effectSettings = {
  #         type = "UNCONDITIONAL_PERMIT"
  #       }
  #     },
  #     {
  #       name = "Deny payments over 10000 USD"
  #       type = "RULE"

  #       enabled = true

  #       condition = {
  #         type = "AND"
  #         conditions = [
  #           {
  #             type = "COMPARISON",
  #             left = {
  #               type = "ATTRIBUTE",
  #               id   = pingone_authorize_trust_framework_attribute.amount.id
  #             },
  #             comparator = "GREATER_THAN",
  #             right = {
  #               type  = "CONSTANT",
  #               value = "10000"
  #             }
  #           }
  #         ]
  #       }

  #       effectSettings = {
  #         type = "UNCONDITIONAL_DENY"
  #       }
  #     },
  #   ]
}