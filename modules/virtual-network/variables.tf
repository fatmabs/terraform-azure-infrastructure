variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group where the virtual network will be created"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the resource group name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default     = {}
}

variable "address_space" {
    description = "Address space for the virtual network"
    type        = list(string)
}