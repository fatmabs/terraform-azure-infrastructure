module "rg-compute-dev" {
  source      = "../../modules/resource-group"
  name_prefix = "compute"
  location    = var.location
  environment = var.environment
  tags        = var.tags
}

module "dev-network-interface" {
  source              = "../../modules/network-interface"
  name_prefix         = "compute"
  location            = module.rg-compute-dev.resource_group_location
  resource_group_name = module.rg-compute-dev.resource_group_name
  environment         = var.environment
  subnet_id           = module.dev-subnet.subnet_id
}


module "dev-virtual-machine" {
  source               = "../../modules/virtual-machine"
  name_prefix          = "compute"
  location             = module.rg-compute-dev.resource_group_location
  resource_group_name  = module.rg-compute-dev.resource_group_name
  environment          = var.environment
  tags                 = var.tags
  vm_size              = "Standard_D2s_v3"
  network_interface_id = module.dev-network-interface.network_interface_id
  admin_username       = "adminuser"
  admin_password       = "P@ssw0rd123!"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-jammy"
  image_sku            = "22_04-lts-gen2"
  image_version        = "latest"

}