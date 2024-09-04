variable "lb_backend_address_pool_address_name" {
  description = "The name of load balancer address poll address"
  type        = string
}

variable "backend_address_pool_id" {
  description = "The ID of backend address pool"
  type        = string
}

variable "virtual_network_id" {
  description = "The ID of virtual network"
  type        = string
}

variable "ip_address" {
  description = "The IP address for load balancer address pool address"
  type        = string
}
