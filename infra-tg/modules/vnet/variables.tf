variable "resource_group_name" {
  type        = string
  description = "The name of the resource group to create"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "East US"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "vnet_address_space" {
  type        = string
  description = "Address space of the VNet"
  default     = "10.0.0.0/16"
}

variable "aks_subnet_name" {
  type        = string
  description = "Name of the subnet dedicated for AKS"
  default     = "aks-subnet"
}

variable "aks_subnet_address_prefix" {
  type        = string
  description = "Address prefix of the AKS subnet"
  default     = "10.0.1.0/24"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to resources"
  default     = {}
}
