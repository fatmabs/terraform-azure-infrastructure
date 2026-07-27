resource "azurerm_storage_account" "this" {
  name                     = "${var.environment}${var.name_prefix}sa"
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = merge({
    Environment = var.environment
    ManagedBy   = "Terraform"
  }, var.tags)
}