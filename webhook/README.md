
```
#update the certgen.sh to change the service and namespace where the controller lives
#update the ext.cnf to match your own localities, and change the alt_names section to match your service name
sh certgen.sh
docker build . -t muhammedsaidkaya/warden:v1

kubectl apply -f warden-k8s.yaml

cat certs/ca.crt | base64
#paste base64 value into the caBundle location in the webhook.yaml file
vi webhook.yml
kubectl apply -f webhook.yaml
```
