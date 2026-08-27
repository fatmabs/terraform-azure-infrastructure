module "rg-network-prod" {
  source      = "../../modules/resource-group"
  name_prefix = "network"
  location    = var.location
  environment = var.environment
  tags        = var.tags
}

module "prod-virtual-network" {
  source              = "../../modules/virtual-network"
  name_prefix         = "network"
  address_space       = var.address_space
  location            = module.rg-network-prod.resource_group_location
  resource_group_name = module.rg-network-prod.resource_group_name
  environment         = var.environment
  tags                = var.tags
}

module "prod-subnet" {
  source                  = "../../modules/subnet"
  environment             = var.environment
  location                = module.rg-network-prod.resource_group_location
  resource_group_name     = module.rg-network-prod.resource_group_name
  virtual_network_name    = module.prod-virtual-network.virtual_network_name
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "prod-nsg" {
  source              = "../../modules/network-security-group"
  name_prefix         = "network"
  location            = module.rg-network-prod.resource_group_location
  resource_group_name = module.rg-network-prod.resource_group_name
  environment         = var.environment
  tags                = var.tags
}




