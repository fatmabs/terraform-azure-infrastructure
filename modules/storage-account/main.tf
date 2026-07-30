resource "azurerm_storage_account" "this" {
  name                     = "${var.environment}${var.name_prefix}${random_id.suffix.hex}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = merge({
    Environment = var.environment
    ManagedBy   = "Terraform"
  }, var.tags)
}