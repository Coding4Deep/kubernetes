#!/bin/bash

#for local setup
sudo kubeadm init --control-plane-endpoint=172.31.16.242  --upload-certs   --apiserver-advertise-address=172.31.16.242 --pod-network-cidr=10.32.0.0/12

mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.2/manifests/calico.yaml

#for ec2 VMs 

sudo kubeadm init    --control-plane-endpoint=192.168.56.10 --upload-certs --apiserver-advertise-address=192.168.56.10   

mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.2/manifests/calico.yaml