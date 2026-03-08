#!/bin/bash

set -e

APP_DIR="/home/ubuntu/devopssec-simple-application"

echo "Starting deployment..."

cd "$APP_DIR"

echo "Pulling latest code from GitHub..."
git pull origin main

echo "Writing SSL private key..."
echo "$PRIVATE_KEY" > privatekey.pem

echo "Writing SSL certificate..."
echo "$SERVER" > server.crt

echo "Installing dependencies..."
npm ci

echo "Restarting application with PM2..."
pm2 restart simpleapp || pm2 start ./bin/www --name simpleapp

echo "Saving PM2 process list..."
pm2 save

echo "Deployment completed successfully."