# **Minukube - Cluster kubernetes para entorno local** 
https://minikube.sigs.k8s.io

## Parámetros
* driver virtualbox - Crea una maquina virtual en virtual box, se debe revisar la documentación por SO
* kubernetes-version - Especifica la versión de k8s
* nodes - Especifica la cantidad de nodos del cluster

👍 Ejecutar con 1 nodos:
`minikube start --kubernetes-version=v1.23.12 --driver=virtualbox --memory=8192 --cpus 4 --addons="metrics-server" `

👍 Levantar con 2 nodos:  

` minikube start --nodes=2 --kubernetes-version=v1.23.12 --driver=virtualbox --memory=4096 --cpus  --addons="metrics-server" `
