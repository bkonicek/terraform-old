data "okta_app_metadata_saml" "saml_data" {
  app_id = "0oace7hozEaqkoHdj5d6"
}

resource "aws_iam_saml_provider" "okta_saml" {
  name                   = "okta"
  saml_metadata_document = data.okta_app_metadata_saml.saml_data.metadata
}

resource "aws_iam_user" "okta" {
  name = "OktaSsoUser"
}

resource "aws_iam_user_policy" "okta" {
  name   = "OktaSsoPolicy"
  user   = aws_iam_user.okta.name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Effect": "Allow",
          "Action": [
              "iam:ListRoles",
              "iam:ListAccountAliases"
          ],
          "Resource": "*"
        }
    ]
}
EOF
}

module "okta_test_role" {
  source = "../../../modules/iam/okta_role"

  provider_arn = aws_iam_saml_provider.okta_saml.arn
  name         = "okta-test"
  tags         = merge({ Name = "okta-test" }, var.common_tags)

}

# resource "aws_iam_policy_attachment" "okta-test-policies" {

# }
