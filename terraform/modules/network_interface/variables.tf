variable "names" {
  description = "The list name of networkd interface"
  type        = list(string)
}

variable "location" {
  description = "The location of networkd interface"
  type        = string
}

variable "resource_group_name" {
  description = "The name of resource group name will manage the networkd interface"
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of ip configuration"
  type        = string
}

variable "subnet_id" {
  description = "The ID of subnet"
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The allocation method used for private IP Address"
  type        = string
  validation {
    condition     = contains(["Dynamic", "Static"], var.private_ip_address_allocation)
    error_message = "The value of private ip address allocation not valid {Dynamic/Static}"
  }
}

variable "num_nic" {
  description = "The number network interface"
  type        = number
}

variable "tags" {
  description = "The meta information for setting up the environment."
  type        = map(string)
}