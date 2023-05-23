#!/bin/sh

minikube kubectl -- label namespace default istio-injection=enabled

minikube kubectl -- delete -f app.yaml
minikube kubectl -- delete -f ingress_gateway.yaml
minikube kubectl -- delete -f ingress_virtual_service.yaml
minikube kubectl -- delete -f egress_service_entry.yaml
minikube kubectl -- delete -f egress_gateway.yaml
minikube kubectl -- delete -f egress_virtual_service.yaml
#kubectl delete -f ingress_tls_gateway.yaml
#kubectl delete -f ingress_tls_virtual_service.yaml


minikube kubectl -- apply -f app.yaml
minikube kubectl -- apply -f ingress_gateway.yaml
minikube kubectl -- apply -f ingress_virtual_service.yaml
minikube kubectl -- apply -f egress_service_entry.yaml
minikube kubectl -- apply -f egress_gateway.yaml
minikube kubectl -- apply -f egress_virtual_service.yaml
#kubectl apply -f ingress_tls_gateway.yaml
#kubectl apply -f ingress_tls_virtual_service.yaml