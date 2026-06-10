# Root Terragrunt Configuration
# Manages remote state in Azure Storage Account and generates Azure Provider configurations.

locals {
  # Load subscription, tenant, and common environment settings
  subscription_id = get_env("ARM_SUBSCRIPTION_ID", get_env("AZURE_SUBSCRIPTION_ID", ""))
  tenant_id       = get_env("ARM_TENANT_ID", get_env("AZURE_TENANT_ID", ""))

  default_tags = {
    Environment = "production"
    ManagedBy   = "Terragrunt"
    Project     = "azure-aks-devops"
  }
}

# Generate the provider file automatically for all child modules
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
  subscription_id = "${local.subscription_id}"
  tenant_id       = "${local.tenant_id}"
}
EOF
}

# Configure Terragrunt to store state files in Azure Storage Account blob container
remote_state {
  backend = "azurerm"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    subscription_id      = local.subscription_id
    tenant_id            = local.tenant_id
    resource_group_name  = "rg-terraform-state-prod"
    storage_account_name = "stproddevopsstate001"
    container_name       = "tfstate"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
  }
}

inputs = {
  tags = local.default_tags
}
