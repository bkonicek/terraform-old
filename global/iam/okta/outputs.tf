output "saml_arn" {
  value       = aws_iam_saml_provider.okta_saml.arn
  description = "ARN of the SAML Provider in AWS"
}
