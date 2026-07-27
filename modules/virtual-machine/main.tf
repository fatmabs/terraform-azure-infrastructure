
resource "azurerm_linux_virtual_machine" "this" {
  name                = "${var.environment}-${var.name_prefix}-vm"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size

  network_interface_ids = [
    var.network_interface_id
  ]

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = merge({
    Environment = var.environment
    ManagedBy   = "Terraform"
  }, var.tags)
}