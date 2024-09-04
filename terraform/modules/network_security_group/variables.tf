variable "name" {
  type        = string
  description = "The Name of Network Security Group"
}

variable "location" {
  type        = string
  description = "The location of Network Security Group"
}

variable "resource_group_name" {
  type        = string
  description = "The Name of resource group will manage Network Security Group"
}

variable "security_rules" {
  description = "List security of network security group"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "tags" {
  type        = map(string)
  description = "The meta information for setting up the environment."
}