#!/bin/zsh

# Stop Docker Compose
echo "Stopping Docker Compose..."
docker compose down

# Remove unused Docker images
echo "Removing unused Docker images..."
docker image prune -f

# Remove unused Docker volumes
echo "Removing unused Docker volumes..."
docker volume prune -f

# Start Docker Compose
echo "Starting Docker Compose..."
docker compose up -d nginx

echo "Operation completed."