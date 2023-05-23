#!/bin/bash

mkdir certs
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=example Inc./CN=example.com' -keyout certs/example.com.key -out certs/example.com.crt

openssl req -out certs/myapp.qwerty.com.csr -newkey rsa:2048 -nodes -keyout certs/myapp.qwerty.com.key -subj "/CN=myapp.qwerty.com/O=app organization"
openssl x509 -req -sha256 -days 365 -CA certs/example.com.crt -CAkey certs/example.com.key -set_serial 0 -in certs/myapp.qwerty.com.csr -out certs/myapp.qwerty.com.crt

openssl req -out certs/client.example.com.csr -newkey rsa:2048 -nodes -keyout certs/client.example.com.key -subj "/CN=client.example.com/O=client organization"
openssl x509 -req -sha256 -days 365 -CA certs/example.com.crt -CAkey certs/example.com.key -set_serial 1 -in certs/client.example.com.csr -out certs/client.example.com.crt

minikube kubectl -- -n istio-system delete secret my-credential
minikube kubectl -- create -n istio-system secret generic my-credential --from-file=tls.key=certs/client.example.com.key --from-file=tls.crt=certs/client.example.com.crt --from-file=ca.crt=certs/example.com.crt