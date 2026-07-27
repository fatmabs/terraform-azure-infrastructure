variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the key vault name"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the key vault"
  type        = string
}

variable "soft_delete_retention_days" {
  description = "Retention days for soft delete"
  type        = number
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled"
  type        = bool
}

variable "tags" {
  description = "Tags to apply to the key vault"
  type        = map(string)
  default     = {}
}