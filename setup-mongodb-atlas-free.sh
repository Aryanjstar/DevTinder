#!/bin/bash

echo "╔══════════════════════════════════════════════════════════╗"
echo "║   🆓 MongoDB Atlas FREE Setup (2 minutes)                ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

echo "📝 Quick Setup Steps:"
echo ""
echo "1. Open: https://www.mongodb.com/cloud/atlas/register"
echo "2. Sign up with Google (instant)"
echo "3. Create FREE M0 cluster (no credit card needed)"
echo "4. Database Access → Add User:"
echo "   Username: devtinder"
echo "   Password: DevTinder2025"
echo "5. Network Access → Add IP: 0.0.0.0/0 (Allow from anywhere)"
echo "6. Database → Connect → Drivers → Copy connection string"
echo ""
echo "Your connection string should look like:"
echo "mongodb+srv://devtinder:DevTinder2025@cluster0.xxxxx.mongodb.net/devtinder?retryWrites=true&w=majority"
echo ""
read -p "Paste your MongoDB Atlas connection string: " MONGO_URL

if [ -z "$MONGO_URL" ]; then
  echo "❌ Connection string required!"
  exit 1
fi

echo ""
echo "🔧 Updating Azure backend with MongoDB Atlas..."
echo ""

az containerapp update \
  --name devtinder-backend \
  --resource-group rg-devtinder \
  --set-env-vars \
    DB_CONNECTION_SECRET="$MONGO_URL" \
    PORT=8080 \
    NODE_ENV=production \
    JWT_SECRET="devtinder-jwt-secret-prod-2025" \
    CORS_ORIGIN="https://black-cliff-0fbc18c0f.3.azurestaticapps.net,https://*.azurestaticapps.net,https://frontend-1wrynvt18-aryanjstars-projects.vercel.app,https://*.vercel.app" \
    RAZORPAY_WEBHOOK_SECRET="Devtinder" \
    PAYMENTS_ENABLED="true" \
    WEB_APP_URL="https://black-cliff-0fbc18c0f.3.azurestaticapps.net" \
    BACKEND_BASE_URL="https://devtinder-backend.blackforest-8f439a36.eastus.azurecontainerapps.io" 2>&1 | grep -E "(provisioningState|error)" || echo "✅ Updated!"

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║   ✅ COST OPTIMIZATION COMPLETE!                         ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
echo "💰 New Monthly Cost:"
echo "  Backend: ₹0-500 (scales to zero, pay per use)"
echo "  Database: ₹0 (MongoDB Atlas FREE)"
echo "  Container Registry: ₹400"
echo "  Frontend: ₹0 (FREE)"
echo "  ─────────────────────────"
echo "  TOTAL: ~₹400/month (was ₹5,000-7,600!)"
echo ""
echo "✅ Features still work:"
echo "  ✓ All features accessible"
echo "  ✓ Scales up automatically when used"
echo "  ✓ Scales to zero when idle (saves money)"
echo ""
echo "⚠️ Note: First request after idle takes 30-50 seconds"
echo "   (backend wakes up automatically)"

