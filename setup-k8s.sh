#!/bin/bash

set -e  

echo "Disabling swap..."
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab

echo "Loading required kernel modules..."
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter

echo "Setting sysctl params required by Kubernetes..."
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

#change the hostname
echo "Setting up hostname..."
# sudo hostnamectl set-hostname master  
# exit or use exec bash   
echo "172.31.39.90  master" | sudo tee -a /etc/hosts > /dev/null
echo "172.31.33.244    worker2" | sudo tee -a /etc/hosts > /dev/null
echo "172.31.20.40   worker1" | sudo tee -a /etc/hosts > /dev/null



sudo apt-get update -y

echo "Installing prerequisites..."
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

echo "Setting up Docker repository..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker..."
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Configuring containerd..."
sudo mkdir -p /etc/containerd
containerd config default | \
  sed -e 's/SystemdCgroup = false/SystemdCgroup = true/' \
      -e 's|sandbox_image = "registry.k8s.io/pause:3.6"|sandbox_image = "registry.k8s.io/pause:3.9"|' | \
  sudo tee /etc/containerd/config.toml > /dev/null
  
  
  
  

sudo systemctl restart containerd
sudo systemctl enable containerd
sudo systemctl status containerd --no-pager

echo "Setting up Kubernetes repository..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | \
  sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | \
  sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

echo "Installing Kubernetes components..."
sudo apt-get update -y
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

echo "Enabling kubelet..."
sudo systemctl enable --now kubelet

echo " Kubernetes setup script completed successfully."