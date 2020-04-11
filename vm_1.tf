resource "azurerm_virtual_machine" "vm" {
  name                  = "vm"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B2ms"
  depends_on = [azurerm_network_interface.nic]

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOs"
    sku       = "7.7"
    version   = "latest"
  }

  storage_os_disk {
    name          = "disk1"
    caching       = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "annas"
    admin_username = "navigator"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
    ssh_keys {
    path = "/home/navigator/.ssh/authorized_keys"
    key_data = var.key
    }
  }

  tags = {
    environment = "staging"
  }
}