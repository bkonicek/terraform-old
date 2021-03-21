resource "aws_iam_saml_provider" "name" {
  name                   = "okta"
  saml_metadata_document = file("metadata.xml")
}
