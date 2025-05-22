# MongoDB StatefulSet Setup on Kubernetes

This guide walks you through the complete process of deploying a **MongoDB StatefulSet** on Kubernetes with persistent storage using `PersistentVolumeClaims` (PVCs). It covers everything from initial setup, storage configuration, deployment, verification, and cleanup.

---

## Prerequisites

- A running Kubernetes cluster (v1.12+ recommended)
- `kubectl` configured to access your cluster
- (Optional) A StorageClass configured for dynamic provisioning
- Basic knowledge of Kubernetes concepts (Pods, StatefulSets, PVC, PV)

---

## 1. Prepare Storage

MongoDB requires persistent storage for data durability. You can either use a StorageClass for dynamic provisioning or create PersistentVolumes (PVs) manually.

### 1.1 (Optional) If no StorageClass available: create PersistentVolume manually

Example PV manifest:

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mongo-pv-1
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /mnt/data/mongo-pv-1
```

Create the PV:

```bash
kubectl apply -f mongo-pv.yaml
```

---

## 2. Deploy MongoDB StatefulSet

Create a StatefulSet with 3 replicas for MongoDB. Each pod will have its own PVC created automatically from the volumeClaimTemplates section.

Save the following manifest as `mongo-statefulset.yaml`:

```yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mongo-set
spec:
  replicas: 3
  selector:
    matchLabels:
      app: mongo
  serviceName: mongo-svc
  terminationGracePeriodSeconds: 10
  template:
    metadata:
      labels:
        app: mongo
    spec:
      containers:
      - name: mongo-cont
        image: mongo:4.4
        ports:
        - name: mongo-port
          containerPort: 27017
        volumeMounts:
        - name: mongo-vol
          mountPath: /data/db
  volumeClaimTemplates:
  - metadata:
      name: mongo-vol
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 1Gi
```

Apply the StatefulSet:

```bash
kubectl apply -f mongo-statefulset.yaml
```

---

## 3. Create Headless Service

The StatefulSet requires a headless service for stable network identities.

Create a file `mongo-service.yaml`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mongo-svc
spec:
  clusterIP: None
  selector:
    app: mongo
  ports:
  - port: 27017
    name: mongo-port
```

Apply the service:

```bash
kubectl apply -f mongo-service.yaml
```

---

## 4. Verify Deployment

Check pods status:

```bash
kubectl get pods -l app=mongo
```

You should see 3 pods with names like `mongo-set-0`, `mongo-set-1`, and `mongo-set-2`.

Check PVCs:

```bash
kubectl get pvc
```

You should see 3 PVCs corresponding to each Mongo pod.

---

## 5. Access MongoDB Pod

To connect to MongoDB inside a pod for verification:

```bash
kubectl exec -it mongo-set-0 -- mongo
```

Try running:

```js
show dbs
```

---

## 6. Scale the StatefulSet

Scale up or down as needed:

```bash
kubectl scale statefulset mongo-set --replicas=5
```

---

## 7. Clean Up / Uninstall

Delete the StatefulSet and Service:

```bash
kubectl delete -f mongo-statefulset.yaml
kubectl delete -f mongo-service.yaml
```

(Optional) Delete PVCs:

```bash
kubectl delete pvc -l app=mongo
```

(Optional) Delete PVs (if created manually):

```bash
kubectl delete pv mongo-pv-1
```

---

## Notes

- The `volumeClaimTemplates` dynamically creates PersistentVolumeClaims for each pod replica.
- `ReadWriteOnce` access mode allows one pod at a time to write to the volume, which fits StatefulSets.
- For production, consider using a dedicated StorageClass backed by reliable network storage (e.g., NFS, AWS EBS, GCE PD).
- StatefulSet pods have stable network identities and persistent storage that remain intact across restarts.


---

Happy Kubernetes MongoDB running! 🚀
```
