# Amazon EBS CSI Driver Installation Guide for Amazon EKS

This guide walks you through installing the **Amazon EBS CSI Driver** using EKS Add-ons with proper IAM role configuration.

---

## 🚀 Prerequisites

* An existing EKS cluster.
* AWS CLI configured with appropriate permissions.
* `kubectl` and `eksctl` installed.

Verify the supported EBS CSI driver versions:

```bash
aws eks describe-addon-versions --addon-name aws-ebs-csi-driver
```

---

---

## 🔐 Step 1: Create OIDC Provider for Your EKS Cluster

1. Set your cluster name:

```bash
cluster_name=<your-cluster-name>
```

2. Retrieve OIDC issuer ID:

```bash
oidc_id=$(aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)
echo $oidc_id
```

3. Check if the OIDC provider exists:

```bash
aws iam list-open-id-connect-providers | grep $oidc_id | cut -d "/" -f4
```

4. If not present, associate OIDC provider:

```bash
eksctl utils associate-iam-oidc-provider \
  --cluster $cluster_name \
  --region <your-region> \
  --approve
```

---

## 🧾 Step 2: Create IAM Role for the EBS CSI Driver

1. Retrieve the OIDC issuer URL:

```bash
aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text
```

2. Create the trust policy file (`aws-ebs-csi-driver-trust-policy.json`) and replace 111122223333 with you account id  , \<region-code> with region code  and EXAMPLED539D4633E53DE1B71EXAMPLE with above output .

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "arn:aws:iam::111122223333:oidc-provider/oidc.eks.<region-code>.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "oidc.eks.<region-code>.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE:aud": "sts.amazonaws.com",
          "oidc.eks.<region-code>.amazonaws.com/id/EXAMPLED539D4633E53DE1B71EXAMPLE:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
        }
      }
    }
  ]
}
```

3. Create the IAM role:

```bash
aws iam create-role \
  --role-name AmazonEKS_EBS_CSI_DriverRole \
  --assume-role-policy-document file://aws-ebs-csi-driver-trust-policy.json
```

4. Attach the AWS managed policy:

```bash
aws iam attach-role-policy \
  --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --role-name AmazonEKS_EBS_CSI_DriverRole
```

---

## 📦 Step 3: Install the EBS CSI Driver as an EKS Add-On

Use the Amazon EKS add-on method to install the EBS CSI Driver:

```bash
aws eks create-addon \
  --cluster-name $cluster_name \
  --addon-name aws-ebs-csi-driver \
  --service-account-role-arn arn:aws:iam::<your-account-id>:role/AmazonEKS_EBS_CSI_DriverRole \
  --region <your-region>
```

Verify installation:

```bash
aws eks describe-addon --cluster-name $cluster_name --addon-name aws-ebs-csi-driver --region <your-region>
```

> ℹ️ Using add-ons simplifies management, improves security, and ensures compatibility.

---

## 🧪 Step 4: Deploy a Sample Application with EBS PVC

You can test the driver by deploying a sample StatefulSet or Deployment using a `PersistentVolumeClaim` that uses the `ebs.csi.aws.com` StorageClass.

Sample PVC manifest:

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ebs-claim
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: ebs-sc
  resources:
    requests:
      storage: 4Gi
```

Sample StorageClass:

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: ebs-sc
provisioner: ebs.csi.aws.com
volumeBindingMode: WaitForFirstConsumer
```

## If  **AWS was not able to validate the provided access credentials** Error occur

```yaml

kubectl annotate serviceaccount \
  ebs-csi-controller-sa \
  -n kube-system \
  eks.amazonaws.com/role-arn=arn:aws:iam::954976312227:role/AmazonEKS_EBS_CSI_DriverRole \
  --overwrite
```

---

## 📚 Additional Resources

* [Amazon EBS CSI Driver GitHub](https://github.com/kubernetes-sigs/aws-ebs-csi-driver)
* [Amazon EKS Add-ons](https://docs.aws.amazon.com/eks/latest/userguide/eks-add-ons.html)
* [Kubernetes Examples](https://github.com/kubernetes/examples)
* [IAM Roles for Service Accounts](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html)

---


## ✅ Summary

By following this guide, you have:

* Configured OIDC provider for your cluster
* Created a secure IAM role for the EBS CSI driver
* Installed the driver using Amazon EKS add-ons
* Validated the setup with a sample workload using EBS volumes

You're now ready to use dynamically provisioned EBS volumes in your EKS workloads. 🎉
