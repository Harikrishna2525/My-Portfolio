# CI/CD Setup Guide - Firebase Hosting Auto-Deploy

This guide will help you set up automatic deployment to Firebase Hosting when you push code to GitHub.

## Prerequisites
- GitHub repository for your portfolio
- Firebase project (already set up: `harikrish-portfolio`)
- Firebase CLI installed

## 🚀 Quick Setup (Recommended - Method 1: Firebase Token)

This is the **simplest method** using a Firebase CI token.

### Step 1: Generate Firebase Token

Run this command in your terminal:

```bash
firebase login:ci
```

This will:
1. Open a browser for authentication
2. Generate a token
3. Display the token in your terminal (copy it!)

### Step 2: Add GitHub Secret

1. Go to your GitHub repository: `https://github.com/YOUR_USERNAME/YOUR_REPO`
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. **Name:** `FIREBASE_TOKEN`
5. **Value:** Paste the token from Step 1
6. Click **Add secret**

### Step 3: Choose Your Workflow

**Option A: Use the simple workflow (Recommended)**
- Rename `.github/workflows/firebase-deploy-simple.yml` to be your main workflow
- Delete `.github/workflows/firebase-deploy.yml`

**Option B: Keep the advanced workflow**
- Delete `.github/workflows/firebase-deploy-simple.yml`
- Follow Method 2 below

### Step 4: Push to GitHub

```bash
git add .
git commit -m "Add CI/CD workflow"
git push origin main
```

✅ **Done!** Every push to `main` or `master` will auto-deploy!

---

## 🔐 Advanced Setup (Method 2: Service Account)

Use this if you need more control or the token method doesn't work.

### Step 1: Create Firebase Service Account

1. Go to [Firebase Console - Service Accounts](https://console.firebase.google.com/project/harikrish-portfolio/settings/serviceaccounts/adminsdk)
2. Click on **Service Accounts** tab
3. Click **Generate New Private Key**
4. Download the JSON file (keep it secure!)

### Step 2: Add GitHub Secret

1. Go to your GitHub repository
2. Navigate to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. **Name:** `FIREBASE_SERVICE_ACCOUNT`
5. **Value:** Paste the **entire contents** of the JSON file
6. Click **Add secret**

### Step 3: Use Advanced Workflow

- Keep `.github/workflows/firebase-deploy.yml`
- Delete `.github/workflows/firebase-deploy-simple.yml`

### Step 4: Push to GitHub

```bash
git add .
git commit -m "Add CI/CD workflow with service account"
git push origin main
```

## Workflow Details

The GitHub Actions workflow (`.github/workflows/firebase-deploy.yml`) will:

1. ✅ Checkout your code
2. ✅ Set up Flutter environment
3. ✅ Install dependencies
4. ✅ Build Flutter web app for production
5. ✅ Deploy to Firebase Hosting automatically

## Monitoring Deployments

- View deployment status in the **Actions** tab of your GitHub repository
- Check live site at: https://harikrish-portfolio.web.app

## Manual Deployment (if needed)

You can still deploy manually:

```bash
flutter build web --release
firebase deploy --only hosting
```

## Troubleshooting

### Build fails in GitHub Actions
- Check the Actions tab for error logs
- Ensure all dependencies are in `pubspec.yaml`

### Deployment fails
- Verify `FIREBASE_SERVICE_ACCOUNT` secret is correctly added
- Check Firebase project permissions

### Want to deploy on different branches?
Edit `.github/workflows/firebase-deploy.yml` and modify the `branches` section.
