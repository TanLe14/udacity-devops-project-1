resource "azurerm_lb" "load_balancer" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.public_ip_name
    public_ip_address_id = var.public_ip_address_id
  }
  tags = var.tags
}
