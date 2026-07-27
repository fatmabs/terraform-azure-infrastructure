resource "azurerm_key_vault" "this" {
  name                        = "${var.environment}-${var.name_prefix}-kv"
  location                    = azurerm_resource_group.this.location
  resource_group_name         = azurerm_resource_group.this.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = var.sku_name
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = var.purge_protection_enabled

  tags = merge({
    Environment = var.environment
    ManagedBy   = "Terraform"
  }, var.tags)
  
}