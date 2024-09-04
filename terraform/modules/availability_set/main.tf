resource "azurerm_availability_set" "az_set" {
  name                         = var.az_set_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  tags                         = var.tags
}