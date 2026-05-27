output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the Resource Group created"
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network created"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The Name of the Virtual Network created"
}

output "aks_subnet_id" {
  value       = azurerm_subnet.aks_subnet.id
  description = "The ID of the AKS subnet created"
}
