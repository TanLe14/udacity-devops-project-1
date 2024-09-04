variable "number_vm" {
  description = "The number virtual machine"
  type        = number
}

variable "name" {
  description = "The Name of virtual machine"
  type        = list(string)
}

variable "location" {
  description = "The location of virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of resource group"
  type        = string
}

variable "network_interface_ids" {
  description = "The list contain ID of network interface"
  type        = list(string)
}

variable "vm_size" {
  description = "The size of virtual machine."
  type        = string
}

variable "storage_disk_names" {
  description = "The list name of storage os disk VM"
  type        = list(string)
}

variable "caching" {
  description = "Caching requiremnet for the Data Disk"
  type        = string
  validation {
    condition     = contains(["None", "ReadOnly", "ReadWrite"], var.caching)
    error_message = "The value of caching not valid, Only in (None, ReadOnly, ReadWrite)"
  }
}

variable "create_option" {
  description = "Specifies how the data disk should be create"
  type        = string
  validation {
    condition     = contains(["Attach", "FromImage", "Empty"], var.create_option)
    error_message = "The value of create option not valid, Only in (Attach, FromIamge, Empty)"
  }
}

variable "managed_disk_type" {
  description = "Specifies the type of managed disk to create"
  type        = string
  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_LRS", "Premium_LRS", "UltraSSD_LRS"], var.managed_disk_type)
    error_message = "The value of managed disk type not valid, Only in (Standard_LRS, StandardSSD_LRS, Premium_LRS, UltraSSD_LRS)"
  }
}

variable "tags" {
  description = "The metadata of resource"
  type        = map(string)
}

variable "availability_set_id" {
  description = "The ID of availability set"
  type        = string
}

variable "image_id" {
  description = "The ID of image for VM"
  type        = string
}

variable "computer_names" {
  description = "List name of computers"
  type        = list(string)
}

variable "admin_usernames" {
  description = "List admin username of computers"
  type        = list(string)
}

variable "admin_passwords" {
  description = "List admin password of computers"
  type        = list(string)
}

variable "disable_password_authentication" {
  description = "Specifies whether password authentication should be disabled"
  type        = bool
}

variable "primary_network_interface_ids" {
  description = "List primary networkd interface of virutal machine"
  type        = list(string)
}
