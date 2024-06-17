resource "azurerm_public_ip" "public_ip" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = "suprim_master_gogo"
  location            = "westus"
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}

resource "azurerm_network_interface" "network_interface" {
  name                = "Puneeth-nic"
  location            = "westus"
  resource_group_name = "suprim_master_gogo"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/c3b5dc2b-df93-4461-a292-7b677519a831/resourceGroups/suprim_master_gogo/providers/Microsoft.Network/virtualNetworks/devops-venet1/subnets/frontend-subnet"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "Linux_vm" {
  name                            = "Puneeth-machine"
  resource_group_name             = "suprim_master_gogo"
  location                        = "westus"
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "Puneeth@1234"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.network_interface.id]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
output "public_ip" {
  value = azurerm_linux_virtual_machine.Linux_vm.public_ip_address
}

