variable "az_set_name" {
  type        = string
  description = "The Name of avaialbility set"
}

variable "location" {
  type        = string
  description = "The location of avaialbility set"
}

variable "resource_group_name" {
  type        = string
  description = "The name of resource group name"
}

variable "platform_update_domain_count" {
  type        = number
  description = "The number update domain"
}

variable "platform_fault_domain_count" {
  type        = number
  description = "The number fault domain"
}

variable "tags" {
  type        = map(string)
  description = "The metadata of resource"
}

