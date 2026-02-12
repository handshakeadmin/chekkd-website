# Remove Old Cheekd Pages from Google Search

## Problem

Google is showing OLD pages from the dating app version of Cheekd:
- ❌ Terms of Service (old Bluetooth dating content)
- ❌ FAQ page
- ❌ Privacy Policy
- ❌ Old dating app description
- ❌ Old circular arrow favicon

These pages **don't exist** on your current site, but Google has them cached.

## Why This Happened

1. Google indexed the old Cheekd dating app site
2. You pivoted to identity verification platform
3. Google hasn't re-crawled or removed old pages yet
4. Old cache = old favicon, old content, old pages showing in search

## URGENT: Remove Old URLs from Google

### Step 1: Find All Old URLs

1. Go to Google Search Console: https://search.google.com/search-console
2. Check "Coverage" or "Pages" report to see indexed URLs
3. Or manually search: `site:chekkd.com` in Google

Look for URLs like:
- `/terms-of-service`
- `/faq`
- `/privacy-policy`
- `/about` (if it has old content)
- Any other old dating app pages

### Step 2: Request Removal of Old URLs

For each old URL that no longer exists:

1. In Google Search Console, go to: **Removals** (left sidebar)
2. Click **"New Request"**
3. Select **"Remove this URL only"**
4. Enter the full URL (e.g., `https://www.chekkd.com/terms-of-service`)
5. Click **Submit**

**Important:** This gives you a temporary removal (6 months). For permanent removal, the page must return 404 or 410.

### Step 3: Return 404 for Old Pages

Your current site only has `index.html`, so old URLs should naturally 404. Verify:

```bash
curl -I https://www.chekkd.com/terms-of-service
curl -I https://www.chekkd.com/faq
curl -I https://www.chekkd.com/privacy-policy
```

Should return: `HTTP/2 404`

### Step 4: Force Re-Index of Homepage

1. In Google Search Console, use **URL Inspection** tool
2. Enter: `https://www.chekkd.com`
3. Click **"Request Indexing"**
4. Repeat for any NEW pages you want indexed

## Favicon Update

✅ **DONE** - Updated favicon from `public/images/favicon.jpg`:
- Created `/favicon-32x32.png` (2.4KB)
- Created `/favicon-192x192.png` (15KB)
- Created `/apple-touch-icon.png` (16KB)

The new favicon will show once Google re-indexes (24-48 hours after requesting indexing).

## Timeline

| Action | Result | Timeframe |
|--------|--------|-----------|
| Request removal of old URLs | URLs disappear from search | 1-2 days |
| Request indexing of homepage | Google re-crawls | 24-48 hours |
| New favicon appears | Updated icon shows | 3-7 days |
| New description shows | Identity verification content | 1-2 weeks |

## Why Ranking is Low

Your site is low in Google because:

1. **Brand new site** - No domain authority yet
2. **No backlinks** - No other sites linking to you
3. **No content** - Only 1 page (homepage)
4. **No traffic history** - Google sees no user engagement
5. **Old indexed pages** - Google confused by pivot

### How to Improve Ranking (Long-term)

1. **Create content:**
   - Blog about identity verification
   - Use cases / case studies
   - FAQ page (NEW content about identity verification)
   - About us page

2. **Get backlinks:**
   - Press releases
   - Product Hunt launch
   - Industry directory listings
   - Guest posts on tech blogs

3. **Build domain authority:**
   - Consistent content updates
   - Social media presence
   - User engagement (waitlist signups)

4. **Technical SEO:**
   - Fast page load (optimize those 2MB+ images!)
   - Mobile-friendly (already done ✅)
   - HTTPS (already done ✅)
   - Sitemap (already done ✅)

5. **Local SEO (if applicable):**
   - Google Business Profile
   - Local directory listings

## Quick Wins

### This Week:
- [ ] Remove old URLs in Google Search Console
- [ ] Request indexing of homepage
- [ ] Deploy favicon update (already created)
- [ ] Optimize images (og-image.png 2.6MB → <200KB)

### Next 30 Days:
- [ ] Create 3-5 blog posts about identity verification
- [ ] Submit to Product Hunt
- [ ] Get listed in startup directories (BetaList, StartupBuffer, etc.)
- [ ] Launch on social media (Twitter, LinkedIn)
- [ ] Get first 100 waitlist signups

### Next 90 Days:
- [ ] Publish 10+ blog posts
- [ ] Get 5-10 backlinks from industry sites
- [ ] Launch beta product
- [ ] Get user testimonials

## Important Notes

**Ranking takes time:**
- New domains: 3-6 months to rank well
- Competitive keywords: 6-12 months
- Brand name searches: 1-4 weeks (after Google re-indexes)

**Your SEO is correct technically.** The issue is:
1. Google's stale cache (fix: remove old URLs)
2. New site with no authority (fix: time + content + backlinks)

## Next Steps (Priority Order)

1. **TODAY:** Remove old URLs in Google Search Console
2. **TODAY:** Request indexing of homepage
3. **THIS WEEK:** Optimize images (2MB+ files)
4. **THIS WEEK:** Deploy favicon update
5. **THIS MONTH:** Create content (blog, about, FAQ)
6. **THIS MONTH:** Get first backlinks
