set +eux

kubectl label node --overwrite t-r-k8s-master node-role.kubernetes.io/master=master
printf "%s\n" {1..3}" "{1..4} | awk -F' ' 'BEGIN{TYPES[1]="small";TYPES[2]="medium";TYPES[3]="large";}{print "t-r-k8s-minion-"TYPES[$1]"-"$2}' | xargs -i bash -c "kubectl label node --overwrite {} node-role.kubernetes.io/worker=worker"
kubectl -n kube-system create secret docker-registry custom-scheduler-registry-secret --docker-server=$K8S_SCHEDULER_REGISTRY --docker-username=$K8S_SCHEDULER_REGISTRY_USERNAME --docker-password=$K8S_SCHEDULER_REGISTRY_PASSWORD
kubectl -n kube-system create secret docker-registry distributed-scheduler-registry-secret --docker-server=$K8S_SCHEDULER_REGISTRY --docker-username=$K8S_DISTRIBUTED_SCHEDULER_REGISTRY_USERNAME --docker-password=$K8S_DISTRIBUTED_SCHEDULER_REGISTRY_PASSWORD
kubectl apply -f kube-scheduler-role.yml
