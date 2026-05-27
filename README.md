# azure-aks-devops
Repo to showcase how you can create a devops pipeline for AKS.

# login to cluster


az aks get-credentials --resource-group rg-prod-aks --name aks-prod-san-001 --admin --overwrite-existing && kubectl get namespaces