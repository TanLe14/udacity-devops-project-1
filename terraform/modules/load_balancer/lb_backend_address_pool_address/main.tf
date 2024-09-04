resource "azurerm_lb_backend_address_pool_address" "lb_backend_address_pool_address" {
  name                    = var.lb_backend_address_pool_address_name
  backend_address_pool_id = var.backend_address_pool_id
  virtual_network_id      = var.virtual_network_id
  ip_address              = var.ip_address
}
