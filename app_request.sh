#!/bin/bash

curl -v -HHost:myapp.qwerty.com --resolve "myapp.qwerty.com:$SECURE_INGRESS_PORT:$INGRESS_HOST" \
  --cacert certs/example.com.crt --cert certs/client.example.com.crt --key certs/client.example.com.key \
  "https://myapp.qwerty.com:$SECURE_INGRESS_PORT/myapp"
