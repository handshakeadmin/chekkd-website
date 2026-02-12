# Google Search Console Setup and Maintenance Guide

## Overview

This guide helps you manage CHEKKD's presence in Google Search results using Google Search Console (GSC).

---

## Part 1: Remove Old/Obsolete URLs

Google may still have old WordPress pages indexed. Here's how to request their removal:

### Step 1: Access URL Removal Tool

1. Go to [Google Search Console](https://search.google.com/search-console)
2. Select your property: `chekkd.com`
3. In the left sidebar, click **Indexing** > **Removals**
4. Click **New Request** button

### Step 2: Request Removal of Old URLs

Submit removal requests for these obsolete URLs:

| URL to Remove | Reason |
|---------------|--------|
| `https://chekkd.com/terms-of-service/` | Page no longer exists |
| `https://chekkd.com/faq/` | Page no longer exists |
| `https://chekkd.com/privacy-policy/` | Page no longer exists (if applicable) |
| `https://chekkd.com/contact/` | Page no longer exists |
| `https://chekkd.com/about/` | Page no longer exists |

**For each URL:**
1. Click **New Request**
2. Select **Temporarily remove URL**
3. Enter the full URL (e.g., `https://chekkd.com/terms-of-service/`)
4. Click **Submit**

> **Note:** Temporary removals last ~6 months. Since these pages return 404, Google will eventually drop them permanently.

---

## Part 2: Request Homepage Re-indexing

After updating SEO content, request Google to re-crawl the homepage:

### Step 1: Use URL Inspection Tool

1. In Google Search Console, click **URL Inspection** in the left sidebar
2. Enter: `https://chekkd.com/`
3. Press Enter to inspect

### Step 2: Request Indexing

1. Wait for the inspection results to load
2. Review the current index status
3. Click **Request Indexing** button
4. Wait for confirmation message

### What to Check:
- **Coverage:** Should show "URL is on Google" after re-indexing
- **Enhancements:** Review any mobile usability or other issues
- **Last crawl date:** Note when Google last visited

---

## Part 3: Verify Sitemap Submission

### Step 1: Check Sitemap Status

1. In left sidebar, click **Indexing** > **Sitemaps**
2. Look for `https://chekkd.com/sitemap.xml`

### Step 2: Submit or Resubmit Sitemap

**If sitemap is not listed:**
1. In the "Add a new sitemap" field, enter: `sitemap.xml`
2. Click **Submit**

**If sitemap exists but has errors:**
1. Click on the sitemap URL
2. Review any errors
3. Click the three dots menu > **Resubmit sitemap**

### Expected Sitemap Contents:
```
https://chekkd.com/
https://chekkd.com/sitemap.xml
```

---

## Part 4: Monitor Search Performance

### Weekly Tasks

1. **Check Index Coverage**
   - Go to **Indexing** > **Pages**
   - Review "Why pages aren't indexed"
   - Address any crawl errors

2. **Review Search Performance**
   - Go to **Performance** > **Search results**
   - Monitor impressions and clicks
   - Track position for target keywords

### Target Keywords to Monitor:
- "identity verification"
- "marketplace verification"
- "peer-to-peer verification"
- "trust badge verification"
- "CHEKKD"
- "chekkd verification"

---

## Part 5: Troubleshooting

### Issue: Old Pages Still Appearing in Search

1. Verify the page returns 404 status
2. Check robots.txt isn't blocking crawlers
3. Submit URL removal request in GSC
4. Wait 1-2 weeks for Google to process

### Issue: Homepage Not Showing Updated Content

1. Use URL Inspection tool
2. Click "Request Indexing"
3. Check "Last crawl" date
4. Verify no crawl errors in the report

### Issue: Missing Favicon in Search Results

1. Ensure favicon is accessible at `/favicon.ico`
2. Verify `<link rel="icon">` tag in HTML head
3. Request re-indexing of homepage
4. Note: Favicon changes can take 2-4 weeks to appear

---

## Part 6: Timeline and Expectations

| Action | Expected Timeframe |
|--------|-------------------|
| URL removal request | 24-48 hours |
| Homepage re-indexing | 1-7 days |
| Search result updates | 1-2 weeks |
| Favicon appearance | 2-4 weeks |
| Full SEO impact | 4-8 weeks |

---

## Quick Reference Links

- [Google Search Console](https://search.google.com/search-console)
- [URL Inspection Tool](https://search.google.com/search-console/inspect)
- [Sitemaps Report](https://search.google.com/search-console/sitemaps)
- [Removals Tool](https://search.google.com/search-console/removals)

---

## Verification Checklist

After completing all steps, verify:

- [ ] All obsolete URL removal requests submitted
- [ ] Homepage re-indexing requested
- [ ] Sitemap submitted and shows "Success"
- [ ] No critical errors in Index Coverage report
- [ ] Mobile usability shows no issues

---

*Last updated: February 2026*
