output "subnet_id" {
  description = "The ID of subnet"
  value       = azurerm_subnet.subnet[*].id
}

output "subnet_name" {
  description = "The Name of subnet"
  value       = azurerm_subnet.subnet[*].name
}
