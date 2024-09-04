variable "lb_name" {
  description = "The name of load balancer"
  type        = string
}

variable "location" {
  description = "The location of load balancer"
  type        = string
}

variable "public_ip_name" {
  description = "The name of public ip address"
  type        = string
}

variable "public_ip_address_id" {
  description = "The id of public ip address"
  type        = string
}

variable "resource_group_name" {
  description = "The name of resource group"
  type        = string
}

variable "tags" {
  description = "The meta information for setting up the environment."
  type        = map(string)
}