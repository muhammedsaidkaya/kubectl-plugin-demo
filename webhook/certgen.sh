keydir="certs"
cd "$keydir"

openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -days 100000 -out ca.crt -subj "/CN=admission_ca"
openssl genrsa -out warden.key 2048
openssl req -new -key warden.key -out warden.csr -subj "/CN=warden.validation.svc" -config ../ext.cnf
openssl x509 -req -in warden.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out warden.crt -days 100000 -extensions v3_req -extfile ../ext.cnf

cp warden.crt wardencrt.pem
cp warden.key wardenkey.pem
