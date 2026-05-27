variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to deploy AKS in"
}

variable "location" {
  type        = string
  description = "Azure region for the cluster"
}

variable "cluster_name" {
  type        = string
  description = "The name of the AKS cluster"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the cluster"
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes to use"
  default     = "1.27.3"
}

variable "vnet_subnet_id" {
  type        = string
  description = "Subnet ID where the AKS node pools should reside"
}

variable "system_node_count" {
  type        = number
  description = "Initial number of nodes in the system pool"
  default     = 2
}

variable "system_node_vm_size" {
  type        = string
  description = "VM size for the system pool nodes"
  default     = "Standard_D2s_v5"
}

variable "user_node_count" {
  type        = number
  description = "Initial number of nodes in the user pool"
  default     = 2
}

variable "user_node_vm_size" {
  type        = string
  description = "VM size for the user pool nodes"
  default     = "Standard_D4s_v5"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to resources"
  default     = {}
}
