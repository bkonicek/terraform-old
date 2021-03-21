variable "okta_org_name" {
  type = string
}

variable "common_tags" {
  type = map(any)
  default = {
    managed-by = "terraform"
  }
}
