# CHEKKD SEO Deployment Checklist

## Pre-Deployment Validation

Run validation script:
```bash
bash validate-seo.sh
```

Expected output: ✅ All checks pass

## Deploy to Production

```bash
bash deploy-seo.sh
```

## Post-Deployment Verification

### 1. Verify Changes Live (Within 5 min)

Visit https://chekkd.com and check:

- [ ] Page loads without errors
- [ ] Hero section looks normal (no visible H1 text showing)
- [ ] "App verifying people..." text still visible
- [ ] "Join the Waitlist" button works

View page source (Cmd+Option+U):
- [ ] Title: "CHEKKD – Identity Verification Platform | Trust, Verified."
- [ ] Meta description starts with "CHEKKD is an identity verification platform"
- [ ] OG image URL: `https://chekkd.com/og-image.png`
- [ ] Hidden H1 tag present (search for "Identity Verification Platform for Marketplaces")

### 2. Test Social Sharing Preview (Within 10 min)

Test OG image displays correctly:

**Option A - Online Tool:**
1. Go to https://www.opengraph.xyz/
2. Enter: `https://chekkd.com`
3. Check preview shows "Transact Safer" image

**Option B - Actual Share:**
1. Share https://chekkd.com on LinkedIn/Slack
2. Verify preview image loads and looks professional

### 3. Verify Assets Load (Within 5 min)

Test these URLs load without 404:
- [ ] https://chekkd.com/og-image.png (should be 2.6MB image)
- [ ] https://chekkd.com/images/chekkd-logo-1200x1200.png (should be 2.2MB)
- [ ] https://chekkd.com/sitemap.xml (should only have chekkd.com URL)

### 4. Google Search Console Setup (Within 24 hours)

**Add Verification Tag:**
1. Go to https://search.google.com/search-console
2. Click "Add Property" → URL prefix → Enter `https://chekkd.com`
3. Choose "HTML tag" verification method
4. Copy the verification tag (looks like `<meta name="google-site-verification" content="...">`)
5. Add to `out/index.html` in `<head>` section after line 26
6. Deploy again with: `git add out/index.html && git commit -m "feat(seo): add GSC verification tag" && git push`
7. Wait for Vercel build to complete
8. Return to GSC and click "Verify"

**Submit Sitemap:**
1. In GSC sidebar, click "Sitemaps"
2. Enter: `https://chekkd.com/sitemap.xml`
3. Click "Submit"
4. Check status shows "Success"

**Request Indexing:**
1. In GSC, use "URL Inspection" tool
2. Enter: `https://chekkd.com`
3. Wait for inspection to complete
4. Click "Request Indexing"
5. Confirm request submitted

### 5. Monitor Google Search (Days 1-14)

**Daily Checks (First 3 Days):**
- [ ] Search "chekkd.com" on Google (incognito mode)
- [ ] Check if description updated (may take 24-72 hours)
- [ ] Check if logo appears in results (may take 1-2 weeks)

**Weekly Checks (Weeks 2-4):**
- [ ] GSC: Check "Performance" tab for impressions/clicks
- [ ] GSC: Review "Coverage" for indexing status
- [ ] GSC: Check "Enhancements" for any issues

### 6. Success Metrics

Track these in Google Search Console:

**Week 1:**
- [ ] Homepage re-indexed (check "Last crawl" date)
- [ ] Description in search results updated

**Week 2:**
- [ ] Impressions increased compared to previous week
- [ ] Logo appears in branded searches ("chekkd.com")

**Month 1:**
- [ ] Click-through rate (CTR) improved
- [ ] Ranking improved for "chekkd" keyword
- [ ] New keywords showing impressions (e.g., "identity verification platform")

## Rollback Plan (If Needed)

If something breaks:

```bash
# Revert last commit
git revert HEAD

# Or restore specific file
git checkout HEAD~1 out/index.html

# Push revert
git push
```

## Expected Timeline

- **Immediate**: Changes visible in HTML source
- **5 minutes**: Vercel build completes, changes live
- **24-72 hours**: Google re-crawls, updates cached version
- **1-2 weeks**: Search results show new description
- **2-4 weeks**: Logo appears in branded searches
- **1 month**: Full SEO impact measurable in GSC

## Troubleshooting

**Issue**: Hero section shows unwanted text
- **Cause**: H1 tag not properly hidden
- **Fix**: Check H1 has `position: absolute; width: 1px; height: 1px; overflow: hidden;` styles

**Issue**: OG image not showing in social shares
- **Cause**: Social platforms cache old image
- **Fix**: Use Facebook Debugger (https://developers.facebook.com/tools/debug/) to clear cache

**Issue**: Google still shows old description
- **Cause**: Google hasn't re-crawled yet
- **Fix**: Wait 24-72 hours, or request indexing in GSC

**Issue**: Images return 404
- **Cause**: Files not in `/out` directory or not deployed
- **Fix**: Check files exist locally, verify git added them, redeploy

## Contact

Questions? Issues? Check:
- Vercel Dashboard: https://vercel.com/dashboard
- Google Search Console: https://search.google.com/search-console
- This repo's issues: (add GitHub URL)
