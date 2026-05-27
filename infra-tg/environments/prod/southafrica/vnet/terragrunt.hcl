include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "region" {
  path   = find_in_parent_folders("region.hcl")
  expose = true
}

terraform {
  source = "../../../../modules/vnet"
}

inputs = {
  resource_group_name       = "rg-prod-networking"
  location                  = include.region.locals.azure_region
  vnet_name                 = "vnet-prod-${include.region.locals.region_short_name}"
  vnet_address_space        = "10.100.0.0/16"
  aks_subnet_name           = "snet-prod-aks-001"
  aks_subnet_address_prefix = "10.100.8.0/21" # 2048 IPs for AKS pods/nodes
}
