variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "location" {
  description = "Azure region for the virtual machine"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the virtual machine name"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the virtual machine will be created"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the virtual machine"
  type        = map(string)
  default     = {}
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "image_publisher" {
  description = "Publisher of the image to use for the virtual machine"
  type        = string
}

variable "image_offer" {
  description = "Offer of the image to use for the virtual machine"
  type        = string
}

variable "image_sku" {
  description = "SKU of the image to use for the virtual machine"
  type        = string
}

variable "image_version" {
  description = "Version of the image to use for the virtual machine"
  type        = string
}

variable "network_interface_id" {
  description = "ID of the network interface to attach to the virtual machine"
  type        = string
}