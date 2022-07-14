#---------------------------------------------------------------
# Provider details
#---------------------------------------------------------------
variable "tenant_id" {
  description = "The AAD tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "resource_location" {
  description = "The Azure Region being deployed to."
  type        = string
  default     = "Australia East"
}

variable "resource_group_name" {
  type = string
}
variable "vm_password" {
  type = string
}

#---------------------------------------------------------------
# Tags
#---------------------------------------------------------------

variable "owner_tag" {
  description = "The tags to apply to resources."
  type        = string
  default     = "arkahna.io"
}

variable "author_tag" {
  description = "The tags to apply to resources."
  type        = string
  default     = "arkahna.io"
}

variable "environment_tag" {
  description = "The name of the environment. Don't use spaces"
  default     = "dev"
  type        = string
}
