output "lb_backend_address_pool_id" {
  description = "The ID of load balancer backend address pool"
  value       = azurerm_lb_backend_address_pool.lb_backend_address_pool.id
}