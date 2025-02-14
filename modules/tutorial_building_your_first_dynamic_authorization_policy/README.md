# Building your first dynamic authorization policy

Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_tutorial_building_your_first_dynamic_authorization_policy.html

An example to replicate the PingOne configuration steps in the referenced tutorial.

## Limitations Against the Tutorial

- [Publishing a Policy](https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_tutorial_policy_publishing_and_endpoint_configuration.html#publishing-a-policy) is not currently possible as the Terraform provider needs additional extension beyond the Trust Framework and Policy Manager APIs.  This means the policy version cannot be explicitly assigned to the decision endpoint using the `authorization_version_id` field of the `pingone_authorize_decision_endpoint` resource ([Link](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/authorize_decision_endpoint#authorization_version_id-1))