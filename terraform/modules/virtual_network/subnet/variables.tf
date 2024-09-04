variable "vnet_name" {
  description = "The name of Vnet"
  type        = string
}

variable "subnet" {
  description = "Subnet configuration"
  type = list(object({
    name                                      = string
    address_prefixes                          = list(string)
    private_endpoint_network_policies_enabled = bool
    service_endpoints                         = optional(set(string))
    delegations = optional(list(object({
      name = string
      service_delegation = object({
        name    = string
        actions = optional(list(string))
      })
    })))
  }))
}

variable "resource_group_name" {
  description = "The name of Resource group"
  type        = string
}

variable "subnet_names" {
  description = "The name of subnet"
  type        = list(string)
  default     = []
}
