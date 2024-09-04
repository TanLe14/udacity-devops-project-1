# common
location                   = "eastus"
resource_group_name        = "udacity-project-1"
resource_group_origin_name = "Azuredevops"
subscription_id            = "df56a173-611b-429d-901a-af369d7d59b5"
tags = {
  name        = "azuredevops"
  environment = "dev"
  project     = "webserver"
}

# Network
address_space = ["10.1.0.0/23"]
vnet_name     = "vnet-udacity"

# subnet
subnet = [
  {
    name                                      = "udacity-subnet-1"
    address_prefixes                          = ["10.1.0.0/23"]
    private_endpoint_network_policies_enabled = false
  }
]

#public ip
public_ip_name    = "frontend-ip-appgw"
allocation_method = "Static"


#availability set
az_set_name                  = "az-set-vm"
platform_fault_domain_count  = 3
platform_update_domain_count = 5

#load balancer
load_balancer_name = "udacity-lb"

#lb backend address pool
lb_backend_address_pool_name = "udacity-lb-backend"

#lb backend address pool address
lb_backend_address_pool_address_name = "udacity-lb-backend-address"
ip_address                           = "10.0.0.1"

#network interface
network_interface_names       = ["vm1-nic", "vm2-nic2"]
ip_configuration_name         = "udacity-ip-config"
private_ip_address_allocation = "Dynamic"

#network security group
network_security_group_name = "udacity-sg"
security_rules = [{
  name                       = "allow-access-same-subnet"
  priority                   = 100
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "*"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  },
  {
    name                       = "udacity-rule"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]

#virtual machine
num_vm                          = "2"
vm_names                        = ["vm1", "vm2"]
vm_size                         = "Standard_D2s_v3"
storage_disk_names              = ["udacity-os-disk1", "udacity-os-disk2"]
caching                         = "ReadWrite"
create_option                   = "FromImage"
managed_disk_type               = "Standard_LRS"
img_name                        = "VMImage"
computer_names                  = ["com1", "com2"]
admin_usernames                 = ["abc", "xyz"]
admin_passwords                 = ["Udacity@123", "Udacity@456"]
disable_password_authentication = false
