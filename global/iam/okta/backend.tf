terraform {
  backend "remote" {
    organization = "bkonicek-personal"

    workspaces {
      name = "okta-global"
    }
  }

  required_version = ">= 0.13.0"

  required_providers {
    okta = {
      source  = "oktadeveloper/okta"
      version = "3.10.1"
    }
  }
}
