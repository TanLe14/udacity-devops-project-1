output "network_interface_id" {
  description = "The ID of network interface"
  value       = azurerm_network_interface.network_interface[*].id
}