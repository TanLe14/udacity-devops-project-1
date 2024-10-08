resource "azurerm_network_interface" "network_interface" {
  count               = var.num_nic
  name                = var.names[count.index]
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
  tags = var.tags
}