#!/usr/bin/env bash
# NOTE: pass password as first argument to this script
# This file tags and uploads an image to Docker Hub
# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=szyborski/ml-api

# Step 2:
# Authenticate & tag
docker login --username szyborski --password $1
docker tag ml-api $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath