# Terragrunt AKS Deployment Config (Production)
include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/aks"
}

dependency "vnet" {
  config_path = "../vnet"

  mock_outputs = {
    aks_subnet_id = "fake-id"
  }
}

inputs = {
  resource_group_name = "rg-prod-aks"
  location            = "eastus2"
  cluster_name        = "aks-prod-eastus2-001"
  dns_prefix          = "aks-prod-dns"
  kubernetes_version  = "1.27.3"

  vnet_subnet_id = dependency.vnet.outputs.aks_subnet_id

  system_node_count   = 3
  system_node_vm_size = "Standard_D2s_v5"

  user_node_count   = 3
  user_node_vm_size = "Standard_D4s_v5"
}
