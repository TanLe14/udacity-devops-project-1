output "loadbalancer_id" {
  description = "The ID of load balancer"
  value       = azurerm_lb.load_balancer.id
}