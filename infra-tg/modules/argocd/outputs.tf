output "argocd_release_name" {
  description = "The name of the Argo CD helm release"
  value       = helm_release.argocd.name
}

output "argocd_namespace" {
  description = "The namespace where Argo CD is installed"
  value       = helm_release.argocd.namespace
}
