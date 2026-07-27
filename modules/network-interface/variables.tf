variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the network security group name"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the network interface will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the resource group"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the network security group will be created"
  type        = string
}