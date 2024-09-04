variable "name" {
  description = "The Name of public IP"
  type        = string
}

variable "resource_group_name" {
  description = "The name of Resource group"
  type        = string
}

variable "location" {
  description = "The location of Public IP"
  type        = string
}

variable "allocation_method" {
  description = "The allocation method used for public IP Address"
  type        = string
  validation {
    condition     = contains(["Dynamic", "Static"], var.allocation_method)
    error_message = "The value of public ip address allocation not valid {Dynamic/Static}"
  }
}

variable "tags" {
  description = "The metadata of resource"
  type        = map(string)
}
