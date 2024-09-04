resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {
  loadbalancer_id = var.loadbalancer_id
  name            = var.lb_backend_address_pool_name
}
