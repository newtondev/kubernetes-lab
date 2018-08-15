#!/bin/sh
# see http://bit.do/kube-decon
# bonus see http://bit.do/kube-decon-power
# video http://bit.do/kube-decon-full
# GitHub: @carsonoid

# Configure the cluster
kubectl config set-cluster kubecon17-cluster --server=https://master.kubecon.carson-anderson.com --certificate-authority=./ca.crt --embed-certs=true

# Create the credentials
kubectl config set-credentials kubecon17-auth --token=REDACTED

# Create the pods via a deployment
kubectl config set-context kubecon17 --cluster=kubecon17-cluster --user=kubecon17-auth

# Create a namespace for the project
kubectl create namespace kube-decon

# Create the pods via a deployment
kubectl --namespace=kube-decon create -f resources/basic/kube-decon-deployment.yaml

# Expose the pods via a service
kubectl --namespace=kube-decon create -f resources/basic/kube-decon-service.yaml

# Get a view of the project
kubectl --namespace=kube-decon get deployment,pods,service,ingress
