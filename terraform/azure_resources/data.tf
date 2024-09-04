data "azurerm_image" "vm_image" {
  name                = var.img_name
  resource_group_name = var.resource_group_origin_name
}
