#!/bin/bash

# Deploy Network plugin
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s-1.11.yaml

# Create a namespace
kubectl create ns mynamespace
kubectl create ns staging
kubectl create ns prod


# Create Pods
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: red
  namespace: mynamespace
spec:
  containers:
  - command:
    - sleep
    - "4500"
    image: busybox
    imagePullPolicy: Always
    name: apple
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-kj9ss
      readOnly: true
  - command:
    - sleep
    - "4500"
    image: busybox
    imagePullPolicy: Always
    name: wine
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-kj9ss
      readOnly: true
  - command:
    - sleep
    - "4500"
    image: busybox
    imagePullPolicy: Always
    name: scarlet
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-kj9ss
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: controlplane
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    key: node.kubernetes.io/not-ready
    operator: Exists
    tolerationSeconds: 300
  - effect: NoExecute
    key: node.kubernetes.io/unreachable
    operator: Exists
    tolerationSeconds: 300
  volumes:
  - name: kube-api-access-kj9ss
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace
EOF

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: test3
  namespace: mynamespace
  labels:
    env: dev
    tier: frontend
    bu: IT
spec:
  containers:
  - image: nginx
    name: test3
EOF


cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: test4
  namespace: mynamespace
  labels:
    env: dev
    tier: frontend
    bu: IT
spec:
  containers:
  - image: nginx
    name: test3
EOF

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: test5
  namespace: mynamespace
  labels:
    env: prod
    tier: backend
    bu: IT
spec:
  containers:
  - image: nginx
    name: test3
EOF

# Create deployment
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test6
  namespace: mynamespace
  labels:
    app: test6
spec:
  replicas: 3
  selector:
    matchLabels:
      app: test6
  template:
    metadata:
      labels:
        app: test6
    spec:
      containers:
      - name: test6
        image: nginx:1.14.2
        ports:
        - containerPort: 80
EOF

cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: test7
  namespace: mynamespace
  labels:
    app: test7
spec:
  replicas: 3
  selector:
    matchLabels:
      app: test7
  template:
    metadata:
      labels:
        app: test7
    spec:
      containers:
      - name: test7
        image: redis
EOF

clear
echo "Please wait 15s for the environment setup..."
sleep 15s
echo ""
echo ""
echo "The test environment is ready! Please go to the quiz to start your test! Good luck!"
echo "Note: The quiz link should be sent to your email. Please contact Chance if you don't receive it. Thanks"
