resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.address_space
  tags                = var.tags
}

locals {
  # Split the provided /16 into /24 subnets. Confirm no overlap with connected
  # on-premises or other Azure ranges before deployment.
  subnet_prefixes = {
    migration  = cidrsubnet(var.address_space[0], 8, 1)
    management = cidrsubnet(var.address_space[0], 8, 2)
  }
}

resource "azurerm_network_security_group" "migration" {
  name                = "nsg-migration"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
}

resource "azurerm_network_security_group" "management" {
  name                = "nsg-management"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags
}

resource "azurerm_subnet" "migration" {
  name                 = "snet-migration"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [local.subnet_prefixes.migration]
}

resource "azurerm_subnet" "management" {
  name                 = "snet-management"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [local.subnet_prefixes.management]
}

resource "azurerm_subnet_network_security_group_association" "migration" {
  subnet_id                 = azurerm_subnet.migration.id
  network_security_group_id = azurerm_network_security_group.migration.id
}

resource "azurerm_subnet_network_security_group_association" "management" {
  subnet_id                 = azurerm_subnet.management.id
  network_security_group_id = azurerm_network_security_group.management.id
}
