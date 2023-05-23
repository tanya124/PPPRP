#!/bin/bash

openssl genpkey -algorithm RSA -out server.key
openssl req -new -x509 -key server.key -out server.crt -days 365 -subj /CN=qwerty.com

kubectl create -n istio-system secret tls my-credential --key=server.key --cert=server.crt