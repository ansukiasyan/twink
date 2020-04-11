resource "azurerm_virtual_network" "vn" {
  name                = "vn"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "sub" {
  name                 = "sub"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "pub" {
    name = "pub"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ip1"
    subnet_id                     = azurerm_subnet.sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pub.id
  }
}

resource "azurerm_network_security_group" "sg" {
  name = "sg"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name  
}

resource "azurerm_network_security_rule" "sr" {
  name                          = "sr"
  priority                      = 1001
  direction                     = "Inbound"
  access                        = "Allow"
  protocol                      = "Tcp"
  destination_port_range        = "22"
  source_port_range             = "*"
  source_address_prefix         = "*"
  destination_address_prefix    = "*"
  resource_group_name           = azurerm_resource_group.rg.name
  network_security_group_name   = azurerm_network_security_group.sg.name
}



