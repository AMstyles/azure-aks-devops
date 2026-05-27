variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the AKS cluster is located"
  type        = string
}

variable "argo_cd_helm_values_path" {
  description = "Absolute path to the argo-cd-helm.yaml file"
  type        = string
}

variable "root_appset_path" {
  description = "Absolute path to the root-appset.yaml file"
  type        = string
}
