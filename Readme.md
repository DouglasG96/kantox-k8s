
## 🚀 ArgoCD Deployment Setup

This project deploys new components within kubernetes cluster using ArgoCD applications and the GitOps approach. Once the infrastructure is provisioned, deploy applications using ArgoCD:
---

## 👌 Prerequisites

Before starting, ensure you have the following installed 
and configured:

### 1. **Kubernetes cluster**
Choose one of the following Kubernetes distributions to set up your local environment:

- Minikube (Local Kubernetes Cluster)
- Kind (Kubernetes in Docker)
- MicroK8s (Lightweight Kubernetes)
- EKS (AWS)
- GKE (GCP)
- AKS (Azure)
- Other

### 2. **kubectl (Kubernetes CLI)**
Ensure you have `kubectl` installed to interact with the Kubernetes cluster:

```bash
brew install kubectl  # For macOS
sudo apt install -y kubectl  # For Debian/Ubuntu
```

Verify installation:
```bash
kubectl version --client
```

### 3. **Kubernetes Config File**
Ensure your `~/.kube/config` file is correctly configured to access the Kubernetes cluster.

You can check your current context:
```bash
kubectl config current-context
```

If needed, switch contexts:
```bash
kubectl config use-context <your-cluster-context>
```

### 4. **ArgoCD CLI**
Install the ArgoCD CLI to interact with ArgoCD from your terminal:

```bash
brew install argocd  # For macOS
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && sudo chmod +x /usr/local/bin/argocd  # For Linux
```

### 5. **Lens (Optional - Kubernetes IDE)**
Install [Lens](https://k8slens.dev/) to get a visual interface for managing Kubernetes clusters.

---


## 📂 Project Structure

```bash
.
├── auxiliary-api/
│   ├── auxiliary-service.app.yaml # Creates argoCD app
│   ├── auxiliary-service-prod-namespace.yaml #Creates auxiliary-production namespaces within cluster
│   ├── configmap.yaml # Manage environment variables for our containers
│   ├── create_secret.sh # Script for creating credentials to allow pull images from registry in our deployments
│   ├── deployment.yaml # Deploys application (containers) in cluster
│   ├── secrets.yaml # Manage AWS secrets credentials
│   ├── service.yaml # Create service to expose APIs running in cluster
├── main-api/
│   ├── configmap.yaml
│   ├── create_secret.sh # script for creating credentials to allow pull images from registry in our deployments
│   ├── deployment.yaml
│   ├── main-api-app.yaml # Creates argoCD app
│   ├── main-api-prod-namespace.yaml
│   ├── service.yaml

```

## 📚 Setup Instructions

### 1. Log in to ArgoCD
Retrieve the initial admin password and log in:

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d;

echo argocd login <ARGOCD_SERVER> --username admin --password <PASSWORD>
```

### 2. Deploy main API
Create your application with ArgoCD:

```bash
cd main-api
kubectl apply -f main-api-app.yaml
```

### 3. Deploy auxiliary API
Create your application with ArgoCD:

```bash
cd auxiliary-api
kubectl apply -f auxiliary-service-app.yaml
```
---

## 🙏 Acknowledgments

- [ArgoCD Documentation](https://argo-cd.readthedocs.io/en/stable/)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Lens Kubernetes IDE](https://k8slens.dev/)

Happy deployment! 🎉