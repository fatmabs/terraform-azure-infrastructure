module "rg-security-dev" {
  source      = "../../modules/resource-group"
  name_prefix = "security"
  location    = var.location
  environment = var.environment
  tags        = var.tags
}



module "dev-kv" {
  source              = "../../modules/key-vault"
  name_prefix         = "security"
  location            = module.rg-security-dev.resource_group_location
  resource_group_name = module.rg-security-dev.resource_group_name
  environment         = var.environment
  sku_name            = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  }
