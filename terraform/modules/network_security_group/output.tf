output "network_security_group_id" {
  description = "The ID of network security group"
  value       = azurerm_network_security_group.network_security_group.id
}