module "resource_group" {
  source              = "../modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = data.azurerm_image.vm_image.location
  tags                = var.tags
}

module "vnet" {
  source              = "../modules/virtual_network"
  name                = var.vnet_name
  address_space       = var.address_space
  location            = data.azurerm_image.vm_image.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
  depends_on          = [module.resource_group]
}

module "subnet" {
  source              = "../modules/virtual_network/subnet"
  subnet              = var.subnet
  vnet_name           = module.vnet.name
  resource_group_name = module.resource_group.name
  depends_on          = [module.resource_group, module.vnet]
}

module "network_security_group" {
  source              = "../modules/network_security_group"
  name                = var.network_security_group_name
  location            = data.azurerm_image.vm_image.location
  resource_group_name = module.resource_group.name
  security_rules      = var.security_rules
  tags                = var.tags
  depends_on          = [module.resource_group]
}

module "network_interface" {
  source                        = "../modules/network_interface"
  num_nic                       = var.num_vm
  names                         = var.network_interface_names
  location                      = data.azurerm_image.vm_image.location
  resource_group_name           = module.resource_group.name
  ip_configuration_name         = var.ip_configuration_name
  subnet_id                     = module.subnet.subnet_id[0]
  private_ip_address_allocation = var.private_ip_address_allocation
  tags                          = var.tags
  depends_on                    = [module.resource_group, module.subnet]
}

module "public_ip" {
  source              = "../modules/public_ip"
  name                = var.public_ip_name
  resource_group_name = module.resource_group.name
  location            = data.azurerm_image.vm_image.location
  allocation_method   = var.allocation_method
  tags                = var.tags
  depends_on          = [module.resource_group]
}

module "load_balancer" {
  source               = "../modules/load_balancer/lb"
  lb_name              = var.load_balancer_name
  location             = data.azurerm_image.vm_image.location
  resource_group_name  = module.resource_group.name
  public_ip_name       = module.public_ip.public_ip_name
  public_ip_address_id = module.public_ip.public_ip_id
  tags                 = var.tags
  depends_on           = [module.resource_group, module.public_ip]
}

module "lb_backend_address_pool" {
  source                       = "../modules/load_balancer/lb_backend_address_pool"
  loadbalancer_id              = module.load_balancer.loadbalancer_id
  lb_backend_address_pool_name = var.lb_backend_address_pool_name
  depends_on                   = [module.load_balancer]
}

module "lb_backend_address_pool_address" {
  source                               = "../modules/load_balancer/lb_backend_address_pool_address"
  lb_backend_address_pool_address_name = var.lb_backend_address_pool_address_name
  backend_address_pool_id              = module.lb_backend_address_pool.lb_backend_address_pool_id
  virtual_network_id                   = module.vnet.vnet_id
  ip_address                           = var.ip_address
  depends_on                           = [module.resource_group, module.vnet, module.lb_backend_address_pool]
}

module "availability_set" {
  source                       = "../modules/availability_set"
  az_set_name                  = var.az_set_name
  location                     = data.azurerm_image.vm_image.location
  resource_group_name          = module.resource_group.name
  platform_fault_domain_count  = var.platform_fault_domain_count
  platform_update_domain_count = var.platform_update_domain_count
  tags                         = var.tags
}

module "virtual_machine" {
  source                          = "../modules/virtual_machine"
  number_vm                       = var.num_vm
  name                            = var.vm_names
  location                        = data.azurerm_image.vm_image.location
  resource_group_name             = module.resource_group.name
  network_interface_ids           = module.network_interface.network_interface_id
  primary_network_interface_ids   = module.network_interface.network_interface_id
  vm_size                         = var.vm_size
  availability_set_id             = module.availability_set.az_id
  image_id                        = data.azurerm_image.vm_image.id
  storage_disk_names              = var.storage_disk_names
  caching                         = var.caching
  create_option                   = var.create_option
  managed_disk_type               = var.managed_disk_type
  computer_names                  = var.computer_names
  admin_usernames                 = var.admin_usernames
  admin_passwords                 = var.admin_passwords
  disable_password_authentication = var.disable_password_authentication
  tags                            = var.tags
  depends_on                      = [module.resource_group, module.network_interface, module.availability_set]
}