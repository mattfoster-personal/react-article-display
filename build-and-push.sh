#!/bin/bash

# Variables
REPO_URL="http://localhost:3000/matt/react-article-display.git"
DOCKER_IMAGE="registry.localhost:5000/react-article-display:latest"
CLONE_DIR="/tmp/react-article-display"

# Step 1: Clone the repository
if [ -d "$CLONE_DIR" ]; then
    rm -rf "$CLONE_DIR"
fi
git clone "$REPO_URL" "$CLONE_DIR"

# Step 2: Navigate to the project directory
cd "$CLONE_DIR"

# Step 3: Build the Docker image
docker build -t "$DOCKER_IMAGE" .

# Step 4: Push the Docker image to the local registry
docker push "$DOCKER_IMAGE"

# Cleanup
rm -rf "$CLONE_DIR"