include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "region" {
  path   = find_in_parent_folders("region.hcl")
  expose = true
}

terraform {
  source = "../../../../modules/aks"
}

dependency "vnet" {
  config_path = "../vnet"

  mock_outputs = {
    aks_subnet_id = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-subnet"
  }
}

inputs = {
  resource_group_name = "rg-prod-aks"
  location            = include.region.locals.azure_region
  cluster_name        = "aks-prod-${include.region.locals.region_short_name}-001"
  dns_prefix          = "aks-prod-dns"
  kubernetes_version  = "1.33.8"

  vnet_subnet_id = dependency.vnet.outputs.aks_subnet_id

  system_node_count   = 1
  system_node_vm_size = "Standard_B2s_v2"

  user_node_count   = 2
  user_node_vm_size = "Standard_B2s_v2"
}
