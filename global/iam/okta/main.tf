data "okta_app_metadata_saml" "saml_data" {
  app_id = "0oace7hozEaqkoHdj5d6"
}

resource "aws_iam_saml_provider" "name" {
  name                   = "okta"
  saml_metadata_document = data.okta_app_metadata_saml.saml_data.metadata
}
