data "okta_app_metadata_saml" "saml_data" {
  app_id = "0oace7hozEaqkoHdj5d6"
}

resource "aws_iam_saml_provider" "okta_saml" {
  name                   = "okta"
  saml_metadata_document = data.okta_app_metadata_saml.saml_data.metadata
}

module "okta_test_role" {
  source = "../../../modules/iam/okta_role"

  provider_arn = aws_iam_saml_provider.okta_saml.arn
  name         = "okta-test"
  tags         = merge({ Name = "okta-test" }, var.common_tags)

}

# resource "aws_iam_role" "okta_test" {
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRoleWithSAML"
#         Effect = "Allow"
#         Principal = {
#           Federated = aws_iam_saml_provider.okta_saml.arn
#         }
#         Condition = {
#           StringEquals = {
#             "SAML:aud" = "https://signin.aws.amazon.com/saml"
#           }
#         }
#       },
#     ]
#   })
#   name = "okta-test"
# }
