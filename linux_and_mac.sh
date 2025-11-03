#!/bin/bash

set -e

REPO_URL="https://github.com/dipakrasal2009/Blog_Project.git"
REPO_DIR="Blog_Project"

echo "Checking Docker installation..."

if ! command -v docker &> /dev/null
then
    echo "Docker not found! Please install Docker manually."
    echo "Follow https://docs.docker.com/get-docker/ for installation."
    exit 1
else
    echo "Docker is already installed."
fi

echo "Cloning the repo..."
git clone "$REPO_URL"

cd "$REPO_DIR"

echo "Building Docker image..."
docker build -t blog_project_image .

echo "Running the Docker container..."
docker run -d -p 8000:8000 --name blog_project blog_project_image

echo "Done! The application should be running at http://localhost:8000"

