#!/bin/bash
set -e

# Get current Git Commit SHA
COMMIT_SHA=$(git rev-parse --short HEAD)
IMAGE_NAME="ghcr.io/${GITHUB_REPOSITORY:-sheharbano404/whats-app-app}"

echo "Building Docker image with tag: $COMMIT_SHA"

# Build image using host Docker daemon (DooD)
docker build -t $IMAGE_NAME:$COMMIT_SHA -t $IMAGE_NAME:latest .

echo "Docker image built successfully!"