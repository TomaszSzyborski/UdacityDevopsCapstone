#!/usr/bin/env bash

# This script runs kubernetes locally

# Step 1:
# This is your Docker ID/path
dockerpath="szyborski/ml-api"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-api-app --image=$dockerpath --port=80 --labels app=ml-api-app --image-pull-policy=Never


# Wait to pod status will be ready
kubectl wait pod/ml-api-app --for=condition=Ready --timeout=-1s

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward ml-api-app 8000:80

# See the output of app running into pods
kubectl logs ml-api-app