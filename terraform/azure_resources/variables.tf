variable "subscription_id" {
  type        = string
  description = "The ID of subscription"
}

variable "resource_group_name" {
  description = "The Name of resource group"
  type        = string
  default     = ""
}

variable "resource_group_origin_name" {
  description = "The Name of resource group of udacity"
  type        = string
  default     = ""
}

variable "address_space" {
  description = "VNET address space"
  type        = list(string)
}

variable "tags" {
  description = "The meta information for setting up the environment."
  type        = map(string)
}

variable "vnet_name" {
  description = "VNET name"
  type        = string
}

variable "location" {
  description = "The location/region where all the resources should be deployed. (lower case, without spaces = Functions regions notation)"
  type        = string
  default     = null
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

variable "subnet_names" {
  description = "The name of subnet"
  type        = list(string)
  default     = []
}

variable "network_security_group_name" {
  description = "The Name of Network Security Group"
  type        = string
  default     = ""
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

variable "network_interface_names" {
  description = "The list name of networkd interface"
  type        = list(string)
  default     = []
}

variable "ip_configuration_name" {
  description = "The name of ip configuration"
  type        = string
  default     = ""
}

variable "private_ip_address_allocation" {
  description = "The allocation method used for private IP Address"
  type        = string
  validation {
    condition     = contains(["Dynamic", "Static"], var.private_ip_address_allocation)
    error_message = "The value of private ip address allocation not valid {Dynamic/Static}"
  }
  default = "Dynamic"
}

variable "public_ip_name" {
  description = "The name of public ip"
  type        = string
  default     = ""
}

variable "allocation_method" {
  description = "The allocation method used for public IP Address"
  type        = string
  validation {
    condition     = contains(["Dynamic", "Static"], var.allocation_method)
    error_message = "The value of public ip address allocation not valid {Dynamic/Static}"
  }
  default = "Dynamic"
}

variable "load_balancer_name" {
  description = "The name of load balancer"
  type        = string
  default     = ""
}

variable "lb_backend_address_pool_name" {
  description = "The name of load balancer backend address pool."
  type        = string
  default     = ""
}

variable "lb_backend_address_pool_address_name" {
  description = "The name of load balancer backend address pool address."
  type        = string
  default     = ""
}

variable "ip_address" {
  description = "The ip address of load balancer backend address pool address"
  type        = string
  default     = ""
}

variable "az_set_name" {
  description = "The name of availability set"
  type        = string
  default     = ""
}

variable "platform_fault_domain_count" {
  description = "The number platform fault domain"
  type        = number
  default     = 3
}

variable "platform_update_domain_count" {
  description = "The number platform update domain"
  type        = number
  default     = 5
}

variable "img_name" {
  description = "The name of image for virtual machine"
  type        = string
  default     = ""
}

variable "availability_set_name" {
  description = "The name of availability set"
  type        = string
  default     = ""
}

variable "num_vm" {
  description = "The number VM"
  type        = number
  default     = 0
}

variable "vm_names" {
  description = "The list name of VMs"
  type        = list(string)
  default     = []
}

variable "vm_size" {
  description = "The vm size"
  type        = string
  default     = ""
}

variable "storage_disk_names" {
  description = "The list name of storage disk name"
  type        = list(string)
  default     = []
}

variable "caching" {
  description = "Caching requiremnet for the Data Disk"
  type        = string
  validation {
    condition     = contains(["None", "ReadOnly", "ReadWrite"], var.caching)
    error_message = "The value of caching not valid, Only in (None, ReadOnly, ReadWrite)"
  }
  default = ""
}

variable "create_option" {
  description = "Specifies how the data disk should be create"
  type        = string
  validation {
    condition     = contains(["Attach", "FromImage", "Empty"], var.create_option)
    error_message = "The value of create option not valid, Only in (Attach, FromIamge, Empty)"
  }
  default = ""
}

variable "managed_disk_type" {
  description = "Specifies the type of managed disk to create"
  type        = string
  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_LRS", "Premium_LRS", "UltraSSD_LRS"], var.managed_disk_type)
    error_message = "The value of managed disk type not valid, Only in (Standard_LRS, StandardSSD_LRS, Premium_LRS, UltraSSD_LRS)"
  }
  default = ""
}

variable "computer_names" {
  description = "List name of computers"
  type        = list(string)
  default     = []
}

variable "admin_usernames" {
  description = "List admin username of computers"
  type        = list(string)
  default     = []
}

variable "admin_passwords" {
  description = "List admin password of computers"
  type        = list(string)
  default     = []
}

variable "disable_password_authentication" {
  description = "Specifies whether password authentication should be disabled"
  type        = bool
  default     = false
}


