#!/bin/bash

set -e

APP_DIR="/home/ubuntu/devopssec-simple-application"

echo "Starting deployment..."

cd "$APP_DIR"

echo "Fetching latest code from GitHub..."
git fetch origin main
git reset --hard origin/main

echo "Installing dependencies..."
npm ci

echo "Restarting application with PM2..."
pm2 restart simpleapp || pm2 start ./bin/www --name simpleapp

echo "Saving PM2 process list..."
pm2 save

echo "Deployment completed successfully."