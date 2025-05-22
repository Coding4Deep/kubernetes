# 📦 NFS Subdir External Provisioner Setup Guide for Kubernetes

A step-by-step guide to install, configure, use, and uninstall the **NFS Subdir External Provisioner** in a Kubernetes cluster using Helm.

> ✅ **Supports dynamic provisioning of Persistent Volumes (PVs) using an NFS server.**

---

## 🧰 Prerequisites

Make sure you have the following:

* ✅ A running Kubernetes cluster (minikube, kubeadm, etc.)
* ✅ A working **NFS server** with a shared directory (e.g., `/mnt/nfs_share`)
* ✅ `nfs-common` package installed on all worker nodes:

  ```bash
  sudo apt install nfs-common -y
  ```
* ✅ Helm installed:

  ```bash
  helm version
  ```

---

## 💽 Step 1: Setup the NFS Server

On the NFS server (e.g., a VM or bare-metal):

```bash
sudo mkdir -p /mnt/nfs_share
sudo chown -R nobody:nogroup /mnt/nfs_share
sudo chmod -R 777 /mnt/nfs_share
```

Edit the exports file:

```bash
sudo nano /etc/exports
```

Add this line (you can restrict `*` to specific CIDRs):

```
/mnt/nfs_share *(rw,sync,no_subtree_check,no_root_squash)
```

Apply the export and restart the service:

```bash
sudo exportfs -rav
sudo systemctl restart nfs-kernel-server
```

Verify export:

```bash
sudo exportfs -v
```

---

## 🧱 Step 2: Add Helm Repo & Install Provisioner

Add the official Helm repo:

```bash
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm repo update
```

Install the provisioner (replace the IP and path):

```bash
helm install nfs-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
  --set nfs.server=192.168.56.13 \
  --set nfs.path=/mnt/nfs_share \
  --set storageClass.defaultClass=true \
  --namespace kube-system
```

---

## 🔍 Step 3: Verify Installation

Check if the pod is running:

```bash
kubectl get pods -n kube-system
```

Check the created `StorageClass`:

```bash
kubectl get storageclass
```

Expected output:

```
NAME                   PROVISIONER                                     DEFAULT
nfs-client (default)   cluster.local/nfs-provisioner-<release-name>    Yes
```

---

## 📦 Step 4: Create PVC and Pod Using StorageClass

Create a PVC using the dynamic NFS provisioner:

```yaml
# nfs-pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nfs-pvc
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
  storageClassName: nfs-client
```

Create a pod using that PVC:

```yaml
# pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: nfs-app
spec:
  containers:
  - name: app
    image: nginx
    volumeMounts:
    - mountPath: "/usr/share/nginx/html"
      name: my-nfs
  volumes:
  - name: my-nfs
    persistentVolumeClaim:
      claimName: nfs-pvc
```

Apply both:

```bash
kubectl apply -f nfs-pvc.yaml
kubectl apply -f pod.yaml
```

---

## 🧹 Step 5: Uninstall NFS Provisioner

To uninstall the provisioner and clean everything:

```bash
# Remove Helm release
helm uninstall nfs-provisioner -n kube-system

# (Optional) Delete all PVCs and the StorageClass
kubectl delete pvc --all
kubectl delete storageclass nfs-client

# (Optional) Clean NFS shared directory manually
sudo rm -rf /mnt/nfs_share/*
```

---

## 🔐 Best Practices & Tips

* 🛡️ Deploy the provisioner in `kube-system` for visibility and minimal accidental deletion.
* 🔐 Secure your NFS server by restricting client access using CIDRs in `/etc/exports`.
* ❌ If the provisioner pod is deleted, dynamic provisioning will stop working until it is recreated.
* 📁 All dynamic PVs will be created as subdirectories inside `/mnt/nfs_share`.

---

## ✅ Conclusion

You now have a working dynamic volume provisioner in your Kubernetes cluster using NFS. This is especially helpful for:

* Shared file storage
* StatefulSets
* Development and test clusters

---

> ✨ Created with ❤️ by \[Deepak Sagar]
