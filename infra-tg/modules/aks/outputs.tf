output "cluster_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "The Name of the AKS cluster"
}

output "cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "The ID of the AKS cluster"
}

output "kube_config_raw" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
  description = "Raw Kubernetes config to connect to cluster"
}

output "oidc_issuer_url" {
  value       = azurerm_kubernetes_cluster.aks.oidc_issuer_url
  description = "OIDC Issuer URL of the cluster for Workload Identity"
}

output "kubelet_identity_client_id" {
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].client_id
  description = "Client ID of the Kubelet identity (useful for ACR pulls)"
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The Name of the Resource Group where the AKS cluster is located"
}
