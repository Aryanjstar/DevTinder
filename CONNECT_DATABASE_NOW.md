# 🚨 2-MINUTE DATABASE SETUP - DO THIS NOW!

## Your App is 99% Ready! Just Connect Database:

### **Option 1: MongoDB Atlas (2 minutes - RECOMMENDED)**

1. **Open this link:** https://www.mongodb.com/cloud/atlas/register

2. **Sign Up** (use Google/GitHub for instant signup - literally 10 seconds)

3. **Create FREE Cluster:**
   - Click "Create" button
   - Select **M0 FREE** (it's already selected)
   - Click "Create Cluster" (takes 1-3 minutes to create)

4. **While cluster creates, set up access:**
   
   **a) Create Database User:**
   - Left menu → "Database Access"
   - Click "Add New Database User"
   - Username: `devtinder`
   - Password: `DevTinder2025`
   - Click "Add User"
   
   **b) Allow Access:**
   - Left menu → "Network Access"
   - Click "Add IP Address"
   - Click "Allow Access from Anywhere" (0.0.0.0/0)
   - Click "Confirm"

5. **Get Connection String:**
   - Left menu → "Database" → Click "Connect" on your cluster
   - Choose "Connect your application"
   - Copy the connection string
   - Replace `<password>` with `DevTinder2025`
   - Add `/devtinder` after `.net` and before the `?`
   
   Your final string should look like:
   ```
   mongodb+srv://devtinder:DevTinder2025@cluster0.xxxxx.mongodb.net/devtinder?retryWrites=true&w=majority
   ```

6. **Connect Your App:**
   
   Run this command in your terminal:
   ```bash
   az containerapp update \
     --name devtinder-backend \
     --resource-group rg-devtinder \
     --set-env-vars \
       DB_CONNECTION_SECRET="mongodb+srv://devtinder:DevTinder2025@cluster0.xxxxx.mongodb.net/devtinder?retryWrites=true&w=majority" \
       PORT=8080 \
       NODE_ENV=production \
       JWT_SECRET="devtinder-jwt-secret-prod-2025" \
       CORS_ORIGIN="https://black-cliff-0fbc18c0f.3.azurestaticapps.net,https://*.azurestaticapps.net"
   ```
   
   (Replace the connection string with YOUR actual one)

---

### **Option 2: Use the Helper Script**

```bash
cd /Users/golu/Developer/DevTinder
./setup-mongodb.sh "paste-your-connection-string-here"
```

---

## ✅ After Connecting Database:

Your app will be FULLY FUNCTIONAL at:
**https://black-cliff-0fbc18c0f.3.azurestaticapps.net**

Test it:
1. Create an account
2. Upload profile picture
3. Add skills
4. Start swiping!
5. Match and chat!

---

## 🎉 THAT'S IT! 

Entire process takes 2 minutes. Your app is already deployed and running on Azure. Just needs the database connection!

