resource "azurerm_virtual_machine" "vm" {
  count                        = var.number_vm
  name                         = var.name[count.index]
  location                     = var.location
  resource_group_name          = var.resource_group_name
  network_interface_ids        = [var.network_interface_ids[count.index]]
  primary_network_interface_id = var.primary_network_interface_ids[count.index]
  vm_size                      = var.vm_size
  availability_set_id          = var.availability_set_id
  storage_image_reference {
    id = var.image_id
  }
  storage_os_disk {
    name              = var.storage_disk_names[count.index]
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.managed_disk_type
  }
  os_profile {
    computer_name  = var.computer_names[count.index]
    admin_username = var.admin_usernames[count.index]
    admin_password = var.admin_passwords[count.index]
  }
  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
  }
  tags = var.tags
}