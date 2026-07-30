module "rg-storage-dev" {
  source      = "../../modules/resource-group"
  name_prefix = "storage"
  location    = var.location
  environment = var.environment
  tags        = var.tags
}

module "dev-storage" {
  source                   = "../../modules/storage-account"
  environment              = var.environment
  name_prefix              = "storage"
  location                 = module.rg-storage-dev.resource_group_location
  resource_group_name      = module.rg-storage-dev.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
