resource "azurerm_network_security_group" "this" {
  name                = "${var.environment}-${var.name_prefix}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = merge({
    Environment = var.environment
    ManagedBy   = "Terraform"
  }, var.tags)
}