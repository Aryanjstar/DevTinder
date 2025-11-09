#!/bin/bash

# DevTinder MongoDB Atlas Setup Script
# This script helps you quickly connect your deployed app to MongoDB Atlas

echo "🗄️  DevTinder MongoDB Setup"
echo "============================="
echo ""
echo "This script will help you connect your deployed backend to MongoDB Atlas."
echo ""

# Check if MongoDB connection string is provided
if [ -z "$1" ]; then
    echo "📋 Instructions:"
    echo ""
    echo "1. Go to https://www.mongodb.com/cloud/atlas/register"
    echo "2. Create a FREE M0 cluster (no credit card required)"
    echo "3. Create a database user"
    echo "4. Whitelist all IPs (0.0.0.0/0) or add Azure Container Apps IPs"
    echo "5. Get your connection string (looks like: mongodb+srv://user:pass@cluster.mongodb.net/)"
    echo "6. Run this script again with your connection string:"
    echo ""
    echo "   ./setup-mongodb.sh \"mongodb+srv://user:pass@cluster.mongodb.net/devtinder\""
    echo ""
    exit 0
fi

MONGODB_CONNECTION="$1"
BACKEND_NAME="devtinder-backend"
RESOURCE_GROUP="rg-devtinder"
FRONTEND_URL="https://black-cliff-0fbc18c0f.3.azurestaticapps.net"

echo "🔄 Updating backend with MongoDB connection..."
echo ""

az containerapp update \
  --name "$BACKEND_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --set-env-vars \
    DB_CONNECTION_SECRET="$MONGODB_CONNECTION" \
    PORT=8080 \
    NODE_ENV=production \
    JWT_SECRET="devtinder-jwt-secret-prod-2025" \
    CORS_ORIGIN="$FRONTEND_URL,https://*.azurestaticapps.net"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ MongoDB connected successfully!"
    echo ""
    echo "🧪 Testing backend health..."
    sleep 5
    
    HEALTH_CHECK=$(curl -s https://devtinder-backend.blackforest-8f439a36.eastus.azurecontainerapps.io/healthz)
    
    if [[ "$HEALTH_CHECK" == *"ok"* ]]; then
        echo "✅ Backend is healthy!"
        echo ""
        echo "🎉 Your DevTinder app is fully deployed and ready!"
        echo ""
        echo "Frontend: $FRONTEND_URL"
        echo "Backend: https://devtinder-backend.blackforest-8f439a36.eastus.azurecontainerapps.io"
        echo ""
        echo "Next steps:"
        echo "1. Open your app: $FRONTEND_URL"
        echo "2. Create an account"
        echo "3. Start swiping!"
    else
        echo "⚠️  Backend health check failed. Check logs:"
        echo "   az containerapp logs show --name $BACKEND_NAME --resource-group $RESOURCE_GROUP --tail 50"
    fi
else
    echo ""
    echo "❌ Failed to update backend. Please check:"
    echo "   1. You're logged in to Azure CLI"
    echo "   2. You have permissions to update the resource"
    echo "   3. Your MongoDB connection string is correct"
fi

echo ""

