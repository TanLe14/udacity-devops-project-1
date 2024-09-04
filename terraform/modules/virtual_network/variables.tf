variable "tags" {
  description = "The meta information for setting up the environment."
  type        = map(string)
}

variable "name" {
  description = "VNET name"
  type        = string
}

variable "address_space" {
  description = "VNET address space"
  type        = list(string)
}

variable "resource_group_name" {
  description = "The name of Resource group"
  type        = string
}

variable "location" {
  description = "The location/region where all the resources should be deployed. (lower case, without spaces = Functions regions notation)"
  type        = string
  default     = null
}
