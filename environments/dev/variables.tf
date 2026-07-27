variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}
variable "environment" {
  description = "The environment for the deployment (e.g., dev, test, prod)."
  type        = string
}
# variable "subscription_id" {
#   description = "The Azure subscription ID where resources will be deployed."
#   type        = string
# }
variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet."
  type        = list(string)
  default     = ["10.0.0.0/24"]
}
