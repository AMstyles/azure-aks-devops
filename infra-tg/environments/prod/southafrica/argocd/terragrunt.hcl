include "root" {
  path = find_in_parent_folders("root.hcl")
}

include "region" {
  path   = find_in_parent_folders("region.hcl")
  expose = true
}

terraform {
  source = "../../../../modules/argocd"
}

dependency "aks" {
  config_path = "../aks"

  mock_outputs = {
    cluster_name        = "mock-cluster"
    resource_group_name = "mock-rg"
  }
}

inputs = {
  cluster_name        = dependency.aks.outputs.cluster_name
  resource_group_name = try(dependency.aks.outputs.resource_group_name, "rg-prod-aks")
}
