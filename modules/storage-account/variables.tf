variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for the storage account name"
  type        = string
}

variable "account_tier" {
  description = "Tier for the storage account"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type for the storage account"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the storage account"
  type        = map(string)
  default     = {}
}