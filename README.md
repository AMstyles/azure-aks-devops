# azure-aks-devops

Repository to showcase how to create a DevOps pipeline for AKS.

## Login to Cluster

Use these commands before the demo to authenticate to Azure and pull the AKS kubeconfig.

```bash
# Login to Azure
az login

# Optional: select the correct subscription
az account set --subscription "<subscription-id-or-name>"

# Pull cluster credentials into your local kubeconfig
az aks get-credentials --resource-group rg-prod-aks --name aks-prod-san-001 --admin --overwrite-existing

# Verify the current context
kubectl config current-context
```

Note: `--admin` is useful for a demo. If you want to show Azure RBAC-based access instead, remove `--admin`.

## Show the Cluster

These are the quickest commands to show the cluster is live and healthy.

```bash
# Show worker nodes
kubectl get nodes -o wide

# Show namespaces
kubectl get namespaces

# Show everything running across the cluster
kubectl get pods -A
kubectl get svc -A
```

## Show the Applications

These commands are useful for showing the Argo CD applications and the workloads it manages.

```bash
# Show Argo CD applications discovered from the GitOps repo
kubectl get applications -n argocd

# Show the workloads deployed into the application namespace
kubectl get all -n my-apps

# Show more detail for the application pods
kubectl get pods -n my-apps -o wide

# Show services and endpoints for the apps
kubectl get svc,endpoints -n my-apps

# Show Argo CD itself
kubectl get pods -n argocd
```

## Optional Demo Commands

Use these if you want a bit more detail during the walkthrough.

```bash
# Inspect a specific application
kubectl describe application my-nginx-app -n argocd

# Watch pods come up live
kubectl get pods -n my-apps -w

# View recent logs from a pod
kubectl logs -n my-apps deployment/my-nginx-app --tail=50
```
