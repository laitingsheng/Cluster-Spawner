#!/usr/bin/env bash

set +eux

# label
kubectl label node --overwrite t-r-k8s-master node-role.kubernetes.io/master=master
kubectl label node --overwrite t-r-k8s-minion-extra node-role.kubernetes.io/extra=extra
# label and taint workers
kubectl label node --overwrite t-r-k8s-minion-worker-{0..7} node-role.kubernetes.io/worker=worker
kubectl taint nodes t-r-k8s-minion-worker-{0..7} only=workload:NoSchedule

# create secrets
kubectl -n kube-system create secret docker-registry custom-scheduler-registry-secret --docker-server=$K8S_SCHEDULER_REGISTRY --docker-username=$K8S_SCHEDULER_REGISTRY_USERNAME --docker-password=$K8S_SCHEDULER_REGISTRY_PASSWORD
kubectl -n kube-system create secret docker-registry distributed-scheduler-registry-secret --docker-server=$K8S_SCHEDULER_REGISTRY --docker-username=$K8S_DISTRIBUTED_SCHEDULER_REGISTRY_USERNAME --docker-password=$K8S_DISTRIBUTED_SCHEDULER_REGISTRY_PASSWORD

# apply role changes
kubectl apply -f kube-scheduler-role.yml
