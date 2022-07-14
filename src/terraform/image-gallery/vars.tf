variable "deploy_location" {
  type        = string
  default     = "australiaeast"
  description = "The Azure Region in which all resources in this example should be created."
}

variable "rg_shared_name" {
  type        = string
  default     = "image-builder-demo"
  description = "Name of the Resource group in which to deploy shared resources"
}