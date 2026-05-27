# azure-aks-devops

Repository to showcase how to create a DevOps pipeline for AKS.

## Login to Cluster

```bash
az aks get-credentials --resource-group rg-prod-aks --name aks-prod-san-001 --admin --overwrite-existing
```