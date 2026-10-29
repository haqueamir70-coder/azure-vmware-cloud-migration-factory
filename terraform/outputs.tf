output "resource_group_name" {
  description = "Name of the created resource group."
  value       = azurerm_resource_group.this.name
}

output "virtual_network_name" {
  description = "Name of the created virtual network."
  value       = azurerm_virtual_network.this.name
}

output "virtual_network_id" {
  description = "Resource ID of the created virtual network."
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Subnet IDs for migration and management traffic segmentation."
  value = {
    migration  = azurerm_subnet.migration.id
    management = azurerm_subnet.management.id
  }
}