#!/bin/bash

#Referencia https://www.cockroachlabs.com/docs/v22.1/deploy-cockroachdb-with-kubernetes-insecure
alias mk="minikube kubectl --"   
minikube start  --kubernetes-version=v1.23.12 --driver=virtualbox --memory=8192 --cpus 4 --addons="metrics-server,metallb"
minikube dashboard
#
mk apply -f cockroachdb-statefulset-insecure.yaml    

#Listar pods
mk get pods

#Cluster init
mk create -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cluster-init.yaml


mk scale -n default statefulset cockroachdb --replicas=5

#Iniciliazar el workload
mk run workload-init -it --image=cockroachdb/cockroach --rm --restart=Never -- workload init bank \
'postgresql://root@cockroachdb-public:26257?sslmode=disable' 

#Lanzar el workload por 5 minutos
mk run workload-init -it --image=cockroachdb/cockroach --rm --restart=Never -- workload run bank --duration=5m \
'postgresql://root@cockroachdb-public:26257?sslmode=disable' 

minikube delete