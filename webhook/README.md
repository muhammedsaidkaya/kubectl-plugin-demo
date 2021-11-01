
```
eval $(minikube docker-env)
docker build . -t sipirsipirmin/warden:v7
kubectl apply -f warden-k8s.yaml
kubectl apply -f webhook.yaml
```