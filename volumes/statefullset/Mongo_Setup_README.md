
# MongoDB Commands Inside StatefulSet Pods

After your MongoDB StatefulSet is deployed and running, you can interact with the MongoDB instances inside each pod as follows.

---

## 1. Access MongoDB Pod Shell

Open a shell session inside a MongoDB pod (replace `mongo-set-0` with your pod name):

```bash
kubectl exec -it mongo-set-0 -- /bin/bash
````

---

## 2. Connect to MongoDB Shell

Once inside the pod, start the Mongo shell client:

```bash
mongo or mongosh
```

You should see the MongoDB shell prompt:

```
>
```

---

## 3. Basic MongoDB Commands (OPTIONAL)

* **Show databases:**

```js
show dbs
```

* **Switch to a database (e.g., testdb):**

```js
use testdb
```

* **Create a collection and insert a document:**

```js
db.users.insert({ name: "Alice", age: 30 })
```

* **Find documents in a collection:**

```js
db.users.find()
```

---

## 4. Check Replica Set Status (if replica set configured)

If you have initialized a replica set (StatefulSets are often used with replica sets), check status:

```js
rs.status()
```

---

## 5. Initialize Replica Set (Optional)

If you want to convert your StatefulSet MongoDB to a replica set manually (not covered in deployment manifest):

Inside the mongo shell on the first pod:

```js
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "mongo-set-0.mongo-svc.default.svc.cluster.local:27017" },
    { _id: 1, host: "mongo-set-1.mongo-svc.default.svc.cluster.local:27017" },
    { _id: 2, host: "mongo-set-2.mongo-svc.default.svc.cluster.local:27017" }
  ]
})
```

Then verify with:

```js
rs.status()
```

---

## 6. Exit Mongo Shell and Pod

Exit Mongo shell:

```js
exit
```

Exit pod shell:

```bash
exit
```

---

# Summary

* Use `kubectl exec` to enter Mongo pod
* Run `mongo` shell to interact with MongoDB
* Use standard MongoDB commands to verify DB, collections, and replica status
* Optional: initialize replica set if required for your setup

---
