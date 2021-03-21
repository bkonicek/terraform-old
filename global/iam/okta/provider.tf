provider "aws" {
  region = "us-east-1"
}

provider "okta" {
  org_name = var.okta_org_name
  base_url = "okta.com"
}
