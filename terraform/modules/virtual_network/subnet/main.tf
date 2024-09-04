resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet)
  name                 = var.subnet[count.index].name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet[count.index].address_prefixes
  resource_group_name  = var.resource_group_name
  service_endpoints    = var.subnet[count.index].service_endpoints

  dynamic "delegation" {
    for_each = var.subnet[count.index].delegations == null ? [] : var.subnet[count.index].delegations
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
}
