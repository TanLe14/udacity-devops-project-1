output "public_ip_id" {
  description = "The ID of public ip"
  value       = azurerm_public_ip.public_ip.id
}

output "id_address" {
  description = "The IP address of public ip"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "public_ip_name" {
  description = "The name of public IP"
  value       = azurerm_public_ip.public_ip.name
}