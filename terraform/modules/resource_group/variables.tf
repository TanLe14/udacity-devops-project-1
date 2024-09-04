variable "resource_group_name" {
  description = "The Name of resource group"
  type        = string
}

variable "location" {
  description = "The location of resource group"
  type        = string
}

variable "tags" {
  description = "The metadata of resource"
  type        = map(string)
}
