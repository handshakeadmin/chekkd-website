# Deployment Instructions for ClickUp Integration

## Step 1: Deploy to Vercel

From your project directory, run:

```bash
npm run deploy
```

Or if you haven't logged in to Vercel yet:

```bash
npx vercel login
npx vercel --prod
```

## Step 2: Add Environment Variables in Vercel

1. Go to https://vercel.com/dashboard
2. Click on your `chekkd-website` project
3. Go to **Settings** → **Environment Variables**
4. Add these three variables (one at a time):

### Variable 1:
- **Name:** `CLICKUP_API_TOKEN`
- **Value:** `pk_168268922_YMF9HVKTNMLTPEL50T2V0IW3S6IALQ8T`
- **Environment:** Production, Preview, Development (check all)

### Variable 2:
- **Name:** `CLICKUP_WORKSPACE_ID`
- **Value:** `9017300222`
- **Environment:** Production, Preview, Development (check all)

### Variable 3:
- **Name:** `CLICKUP_LIST_ID`
- **Value:** `901706927077`
- **Environment:** Production, Preview, Development (check all)

## Step 3: Redeploy

After adding the environment variables, you need to trigger a new deployment:

```bash
npm run deploy
```

Or in Vercel dashboard:
- Go to **Deployments** tab
- Click the three dots (...) on the latest deployment
- Click **Redeploy**

## Step 4: Test the Live Site

1. Visit your live site at https://chekkd.com (or your Vercel URL)
2. Click "Join the Waitlist"
3. Fill out the form
4. Submit
5. Check your ClickUp list for the new task!

## Troubleshooting

If it still doesn't work:

1. Check Vercel **Functions** logs:
   - Go to your project in Vercel
   - Click **Deployments** → Select latest deployment
   - Click **Functions** tab
   - Look for `/api/waitlist-signup` logs

2. Check if environment variables are set:
   - Go to **Settings** → **Environment Variables**
   - All 3 variables should be there

3. Try the form on your live site (not localhost)
   - The API only works when deployed to Vercel
   - Local testing shows success screen but doesn't actually submit

## What Happens When Someone Submits

1. Form data is sent to `/api/waitlist-signup` (Vercel serverless function)
2. Function validates the data
3. Function creates a task in ClickUp list `901706927077` with:
   - Task name: "[First Name] [Last Name] - Waitlist Signup"
   - Description: Email, phone, source, timestamp
   - Tag: `chekkd_waitlist`
   - Status: `new`
4. Success screen shows to user
5. Task appears in your ClickUp "Waitlist Leads" list
