
---

# 🐳 Kubernetes cluster Setup Script

This script automates the installation and configuration of **Docker**, **containerd**, and **Kubernetes (v1.30)** on **Ubuntu**-based systems. It includes kernel module setup, sysctl tuning, host configuration, and ensures the environment is production-grade and Kubernetes-ready.

---

## 📋 Prerequisites

* Ubuntu 20.04+ on all nodes (master and workers)
* Root or sudo privileges
* Internet access on the machine

---

## ⚙️ What This Script Does

1. Disables swap (required by Kubernetes)
2. Loads necessary kernel modules
3. Sets sysctl params for networking
4. Adds static host mappings
5. Installs Docker and containerd
6. Configures containerd for Kubernetes
7. Adds Kubernetes apt repository
8. Installs kubelet, kubeadm, and kubectl
9. Enables and starts services

---

## 🚀 Usage

### Step 1: Save the Script

Save the script as `setup-k8s.sh`.

```bash
vi setup-k8s.sh
```

Paste the contents, then:

```bash
chmod +x setup-k8s.sh
```

### Step 2: Run the Script

```bash
sudo ./setup-k8s.sh
```

> 🛠️ It may take a few minutes depending on your internet speed and machine specs.

---

## 🖥️ Host Mapping Used (edit as needed)

```ini
172.31.39.90     master
172.31.33.244    worker2
172.31.20.40     worker1
```

> You can change these IPs in the script according to your own node setup.

---

## 📦 Installed Components

* Docker CE + CLI
* containerd (with `SystemdCgroup = true`)
* Kubernetes v1.30 components:

  * `kubelet`
  * `kubeadm`
  * `kubectl`

---

## ✅ Post-Installation

After running this on all nodes:

* Run `kubeadm init` on the master
* Join workers with the token from `kubeadm join`
* Optionally install a CNI plugin (e.g., Calico, Flannel)

---

## ❗ Troubleshooting

* Ensure `/etc/fstab` has swap permanently disabled
* Verify NTP or time sync is accurate across nodes
* Restart the node if kubelet fails to start after install

---


