terraform {
  backend "remote" {
    organization = "bkonicek-personal"

    workspaces {
      name = "okta-global"
    }
  }

  required_version = ">= 0.13.0"
}
