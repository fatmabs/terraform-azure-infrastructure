module "rg-network-dev" {
  source      = "../../modules/resource-group"
  name_prefix = "network"
  location    = var.location
  environment = var.environment
  tags        = var.tags
}

module "dev-virtual-network" {
  source              = "../../modules/virtual-network"
  name_prefix         = "network"
  address_space       = var.address_space
  location            = module.rg-network-dev.resource_group_location
  resource_group_name = module.rg-network-dev.resource_group_name
  environment         = var.environment
  tags                = var.tags
}

module "dev-subnet" {
  source                  = "../../modules/subnet"
  environment             = var.environment
  location                = module.rg-network-dev.resource_group_location
  resource_group_name     = module.rg-network-dev.resource_group_name
  virtual_network_name    = module.dev-virtual-network.virtual_network_name
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "dev-nsg" {
  source              = "../../modules/network-security-group"
  name_prefix         = "network"
  location            = module.rg-network-dev.resource_group_location
  resource_group_name = module.rg-network-dev.resource_group_name
  environment         = var.environment
  tags                = var.tags
}




