# Controlling access to APIs managed by an API service

Ref: https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_protect_all_apis.html

An example to replicate the PingOne configuration steps in the referenced tutorial.

## Limitations Against the Tutorial

- [Adding a policy for the API operation](https://docs.pingidentity.com/pingone/authorization_using_pingone_authorize/p1az_aam_tutorial_create_policy_for_api_operation.html) is not currently possible as the Terraform provider needs a contract with the API to naviage the policy hierarchy.
