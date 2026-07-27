variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the subnet will be created"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network where the subnet will be created"
  type        = string
}


variable "subnet_address_prefixes" {
    description = "Address prefixes for the subnet"
    type        = list(string)
  
}