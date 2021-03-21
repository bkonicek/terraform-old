variable "provider_arn" {
  type        = string
  description = "ARN of the Okta provider"
}

variable "name" {
  type        = string
  description = "Name of the role"
}

variable "tags" {
  type        = map(any)
  description = "Map of tags to add to the role"
}
