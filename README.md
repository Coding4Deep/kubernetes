<div align="center">
   
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![kubectl](https://img.shields.io/badge/kubectl-326CE5?style=for-the-badge&logo=powerbi&logoColor=white)
![kubeadm](https://img.shields.io/badge/kubeadm-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Minikube](https://img.shields.io/badge/Minikube-38BDF8?style=for-the-badge&logo=minikube&logoColor=white)
![KIND](https://img.shields.io/badge/KIND-%23009639?style=for-the-badge&logo=kubernetes&logoColor=white)
![Amazon EKS](https://img.shields.io/badge/Amazon%20EKS-232F3E?style=for-the-badge&logo=amazon-eks&logoColor=white)
![Helm](https://img.shields.io/badge/Helm-0F1689?style=for-the-badge&logo=helm&logoColor=white)
![Argo CD](https://img.shields.io/badge/Argo%20CD-EF7B4D?style=for-the-badge&logo=argo&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)
![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)
![Calico](https://img.shields.io/badge/Calico-00B5CC?style=for-the-badge&logo=linuxfoundation&logoColor=white)
---

</div>

# Kubernetes projects & tutorial

Welcome to the **Kubernetes** repository by Coding4Deep. This collection showcases various Kubernetes configurations, deployments, and best practices aimed at simplifying container orchestration and enhancing cloud-native application management.

## 🚀 Overview

This repository serves as a practical resource for developers and DevOps enthusiasts looking to:

* Understand Kubernetes concepts through hands-on examples.
* Deploy and manage applications using Kubernetes resources.
* Implement persistent storage solutions like NFS provisioners.
* Scale applications efficiently within a Kubernetes cluster.


## 🛠️ Technologies Used

* **Kubernetes**: Container orchestration platform for automating application deployment, scaling, and management.
* **YAML**: Markup language used for configuration files.
* **Docker**: Platform for developing, shipping, and running applications in containers.
* **NFS**: Network File System for providing shared storage solutions.

## 📚 Getting Started

To get started with the projects in this repository:

1. Clone the repository:

   ```bash
   git clone https://github.com/Coding4Deep/kubernetes.git
   cd kubernetes
   ```

2. Navigate to the desired directory (e.g., `volumes/`) and apply the Kubernetes configurations:

   ```bash
   kubectl apply -f .
   ```

3. Follow the specific instructions in each directory's README file for detailed setup and usage.

## 🔍 Usage Examples

### Deploying a MongoDB StatefulSet with Persistent Storage

1. Navigate to the `volumes/` directory:

   ```bash
   cd volumes/
   ```

2. Apply the StatefulSet and service configurations:

   ```bash
   kubectl apply -f mongo-statefulset.yaml
   kubectl apply -f mongo-service.yaml
   ```

3. Verify the deployment:

   ```bash
   kubectl get pods -l app=mongo
   kubectl get pvc
   ```

4. Access the MongoDB shell:

   ```bash
   kubectl exec -it mongo-set-0 -- mongo
   ```

### Setting Up an NFS Provisioner

1. Navigate to the `volumes/` directory:

   ```bash
   cd volumes/
   ```

2. Apply the NFS provisioner configurations:

   ```bash
   kubectl apply -f nfs-provisioner.yaml
   ```

3. Verify the deployment:

   ```bash
   kubectl get pods -l app=nfs-provisioner
   kubectl get storageclass
   ```

4. Create a PersistentVolumeClaim using the NFS provisioner:

   ```bash
   kubectl apply -f pvc-nfs.yaml
   ```

## 📄 Documentation

For detailed instructions and explanations, refer to the following documents:

* [NFS Provisioner Setup Guide](volumes/statefullset/NFS_PROVISIONER_README.md): Step-by-step instructions for setting up the NFS provisioner in your Kubernetes cluster.
* [MongoDB StatefulSet Deployment](volumes/statefullset/Mongo_Setup_README.md): Guide on deploying MongoDB using a StatefulSet with persistent storage.

## 🧹 Cleanup

To remove the deployed resources:

1. Delete the StatefulSet and service:

   ```bash
   kubectl delete -f mongo-statefulset.yaml
   kubectl delete -f mongo-service.yaml
   ```

2. Delete the NFS provisioner:

   ```bash
   kubectl delete -f nfs-provisioner.yaml
   ```

3. Delete the PersistentVolumeClaim:

   ```bash
   kubectl delete -f pvc-nfs.yaml
   ```

## 🤝 Contributing

Contributions are welcome! If you have improvements, bug fixes, or new examples to add, please fork the repository and submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to customize this `README.md` further to align with any additional projects or specific configurations you have in your repository.
