# CHEKKD Website

[![Deployed on Vercel](https://img.shields.io/badge/deployed%20on-Vercel-000000?style=flat&logo=vercel)](https://vercel.com)
[![WordPress](https://img.shields.io/badge/CMS-WordPress-21759B?style=flat&logo=wordpress)](https://wordpress.org)
[![Next.js](https://img.shields.io/badge/Framework-Next.js-000000?style=flat&logo=next.js)](https://nextjs.org)

> **Trust, Verified.** The official marketing website for CHEKKD - a rapid identity verification and reliability scoring platform for secure peer-to-peer transactions.

## 🎯 Overview

CHEKKD is a trust and verification platform that helps users safely conduct peer-to-peer transactions across marketplaces, dating, hiring, and more. This repository contains the marketing website that showcases the platform's features and drives waitlist signups.

**Live Site:** [chekkd.com](https://chekkd.com)
**Waitlist:** [chekkdlounge.com](https://chekkdlounge.com)

## ✨ Key Features

### Platform Capabilities
- **Instant ID Checks** - Photo ID and biometric verification in minutes
- **Reliability Score** - Comprehensive "trustometer" combining identity, history, references, and behavior
- **Shareable TrustBadge** - Instant credibility indicator for users
- **Fraud Prevention** - Real-time tracking of conversions, disputes, and anomalies

### Use Cases
- 🛒 Marketplace transactions (peer-to-peer sales)
- 💕 Dating platforms
- 💼 Hiring and gig work
- 🔒 General fraud prevention for transaction platforms

## 🏗️ Architecture

### Tech Stack

**Frontend:**
- WordPress CMS (Salient theme v18.0.2)
- Next.js (static export)
- jQuery 3.7.1
- Custom animations (anime.js, transit.js)

**Backend:**
- PHP-based WordPress installation
- MySQL/MariaDB database

**Deployment:**
- Vercel (static hosting)
- CDN-optimized assets
- 1-year cache for static assets

**Key Plugins:**
- JS Composer Salient (page builder)
- FluentForm (contact forms)
- Salient Core ecosystem

### Project Structure

```
chekkd-website/
├── out/                    # Static exported site (production build)
│   ├── index.html         # Main homepage (165KB)
│   ├── wp-content/        # Static WordPress assets
│   └── wp-includes/       # WP styling/JS assets
├── public/                # Static assets
│   └── images/           # Hero images, logos, favicon
├── wordpress-backup/      # Full WordPress installation backup
│   ├── wp-admin/         # WordPress admin interface
│   ├── wp-content/       # Themes, plugins, uploads
│   └── wp-includes/      # WordPress core files
├── vercel.json           # Vercel deployment configuration
└── .gitignore            # Git ignore rules
```

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ (for Next.js build tools)
- PHP 7.4+ (for WordPress)
- MySQL 5.7+ or MariaDB
- Git

### Local Development

1. **Clone the repository**
   ```bash
   git clone git@github.com:handshakeadmin/chekkd-website.git
   cd chekkd-website
   ```

2. **WordPress Setup** (if developing WordPress content)
   ```bash
   # Set up local WordPress environment (MAMP, Local, or Docker)
   # Import wordpress-backup/ to your local server
   # Update wp-config.php with local database credentials
   ```

3. **View Static Site**
   ```bash
   # Serve the out/ directory
   npx serve out
   # Open http://localhost:3000
   ```

### Environment Variables

Create a `.env.local` file for local development:

```bash
# WordPress Database
DB_NAME=chekkd_wp
DB_USER=root
DB_PASSWORD=your_password
DB_HOST=localhost

# WordPress Keys (generate at https://api.wordpress.org/secret-key/1.1/salt/)
AUTH_KEY=your_auth_key
SECURE_AUTH_KEY=your_secure_auth_key
LOGGED_IN_KEY=your_logged_in_key
NONCE_KEY=your_nonce_key
```

## 📦 Deployment

### Vercel (Production)

The site is deployed automatically on Vercel from the `main` branch.

```bash
# Manual deployment
vercel --prod
```

### Configuration

`vercel.json` settings:
- **Output Directory:** `out/` (static HTML)
- **Build Command:** `null` (pre-built static site)
- **Cache Strategy:** 1 year for static assets, 0 for HTML
- **Rewrites:** Contact page routing configured

## 🔧 Development Workflow

### Making Content Changes

1. Edit content in WordPress admin (local or staging)
2. Export updated static HTML
3. Replace `out/` directory contents
4. Commit and push changes
5. Vercel auto-deploys from main

### Code Style

Follows global development standards from `/CLAUDE.md`:
- TypeScript strict mode where applicable
- Functional patterns preferred
- Minimal comments (self-documenting code)
- Mobile-first design

### Commit Convention

```
type(scope): description

Types: feat, fix, refactor, docs, test, chore
Example: feat(homepage): add hero video background
```

## 📊 Performance

- **Static Site:** All pages pre-rendered for optimal load times
- **CDN Delivery:** Global edge network via Vercel
- **Caching:** Aggressive caching strategy (1 year for assets)
- **Image Optimization:** WebP format for hero images
- **Mobile-First:** Responsive design optimized for all devices

## 🎨 Design System

### Salient Theme
- Premium WordPress theme from ThemeNectar
- Version: 18.0.2
- Custom page builder with Visual Composer
- Extensive animation library

### Brand Assets
- Primary Logo: `/public/images/logo.png`
- Favicon: `/public/images/favicon.jpg`
- Hero Background: `/public/images/hero-bg.webp`

## 🤝 Contributing

### Branching Strategy
- `main` - Production branch (protected)
- `develop` - Development branch
- `feature/*` - Feature branches
- `hotfix/*` - Emergency fixes

### Pull Request Process

1. Create feature branch from `develop`
2. Make changes following code style guidelines
3. Test locally (static site and WordPress if applicable)
4. Submit PR with detailed description
5. Wait for review and approval
6. Merge to `develop`, then to `main` for deployment

## 📝 Version History

### v1.0.0 (2026-02-08)
- Initial production release
- WordPress + Next.js static export architecture
- Sundance Film Festival launch
- Core features: ID verification, reliability scoring, TrustBadge
- Waitlist signup integration
- Full Vercel deployment pipeline

## 🔐 Security

- No `.env` files committed to repository
- WordPress credentials stored securely
- Vercel environment variables for production secrets
- Regular security updates for WordPress core and plugins
- Form spam protection via Akismet

## 📞 Support

For questions or issues:
- **Email:** admin@letshandshake.io
- **Platform:** CHEKKD
- **Organization:** Handshake

## 📄 License

Proprietary - All rights reserved by Handshake/CHEKKD

## 📈 Analytics & SEO

### Analytics Stack

The website includes comprehensive analytics tracking with GDPR-compliant cookie consent:

#### Google Analytics 4
- **Measurement ID:** `G-EK99JFRXJW`
- **Features:** Page views, event tracking, scroll depth monitoring
- **Consent Mode:** Integrated with v2 consent mode (denied by default)
- **Privacy:** IP anonymization enabled, secure cookie flags

#### Vercel Analytics
- **Type:** Privacy-first (no cookies)
- **Features:** Page views, performance metrics
- **Auto-provisioned** for Vercel projects

#### Cloudflare Web Analytics
- **Token:** `dwihYz5cSazrymi5MLlt3gIgpl7z9ZWtYd1_eac1`
- **Type:** Privacy-first (no cookies)
- **Features:** Traffic analytics, bot detection

### Cookie Consent

GDPR-compliant cookie banner using [orestbida/cookieconsent](https://github.com/orestbida/cookieconsent):
- Default state: All analytics denied
- User choice: Accept all / Reject all
- Categories: Necessary (always enabled), Analytics (optional)
- Consent persisted across sessions

### Event Tracking

Custom event tracking for user interactions:

**Tracked CTAs:**
- Navigation "Join Waitlist" → `nav_click` / `nav_join_waitlist`
- Hero CTA "Join the Waitlist" → `cta_click` / `hero_join_waitlist`
- Footer "Join Waitlist" → `footer_click` / `footer_join_waitlist`

**Automatic Tracking:**
- Scroll depth: 25%, 50%, 75%, 100%
- All elements with `data-track-event` attribute

**Adding Custom Events:**
```html
<button data-track-event="button_click" data-event-label="my_custom_button">
  Click Me
</button>
```

### SEO Optimization

#### Meta Tags
- **Title:** CHEKKD – Trust, Verified.
- **Description:** Verify identities instantly with CHEKKD's TrustBadge...
- **Canonical URL:** https://chekkd.com/
- **Theme Color:** #8e4aff (brand purple)

#### Open Graph (Social Sharing)
- **Type:** website
- **Image:** `og-image.png` (1200x630px)
- **Image (Square):** `og-image-square.png` (1200x1200px)
- Optimized for Facebook, LinkedIn, Slack

#### Twitter Card
- **Type:** summary_large_image
- **Image:** Same as Open Graph
- Optimized for Twitter/X sharing

#### Schema.org Structured Data
JSON-LD markup includes:
- **Organization:** CHEKKD company details
- **WebSite:** Site metadata and search action
- **WebPage:** Current page details
- **BreadcrumbList:** Navigation hierarchy

Validates at: https://validator.schema.org/

#### Modern Favicons
- `favicon.svg` - Vector (scalable, modern browsers)
- `favicon-32x32.png` - Browser tabs
- `favicon-192x192.png` - Android/PWA
- `apple-touch-icon.png` - iOS devices
- `site.webmanifest` - PWA manifest

#### Technical SEO
- **robots.txt:** Allows all crawlers including AI bots (ChatGPT, Perplexity, Claude)
- **sitemap.xml:** XML sitemap for search engines
- **DNS Prefetch:** Preconnect to analytics domains for performance

### Maintenance Tasks

#### Monthly
1. Update `sitemap.xml` last modified date:
   ```xml
   <lastmod>2026-MM-DD</lastmod>
   ```

2. Review Google Search Console:
   - Check for crawl errors
   - Monitor indexing status
   - Review rich results

3. Check analytics dashboards:
   - GA4: User behavior, conversions
   - Vercel: Performance metrics
   - Cloudflare: Traffic patterns

#### Quarterly
1. Audit meta descriptions (check CTR in Search Console)
2. Update Schema.org data (new properties)
3. Review OG image performance (social sharing engagement)
4. Check for sitelinks in Google search results

#### When Re-exporting from WordPress
If you need to re-export HTML from WordPress:

1. Backup current `out/index.html`:
   ```bash
   cp out/index.html out/index.html.backup
   ```

2. Export new HTML from WordPress

3. Re-apply analytics and SEO changes:
   ```bash
   python3 update-html.py
   python3 add-tracking-attrs.py
   ```

   Or manually merge changes using:
   ```bash
   diff -u out/index.html.backup out/index.html.new
   ```

### Verification & Testing

#### Local Testing
```bash
# Start local server
npm run dev

# Test in browser
open http://localhost:3000

# Test files exist
npm run test:seo
```

#### Browser DevTools Testing
1. **Console:** Check for JavaScript errors
2. **Network Tab:**
   - Filter by "google-analytics" - should see GA4 requests
   - Filter by "vercel" - should see Vercel Analytics
   - Filter by "cloudflare" - should see Cloudflare beacon
3. **Application Tab:**
   - Check cookies after accepting consent
   - Verify localStorage for consent state

#### Production Validation
```bash
# Deploy to production
npm run deploy

# Validate URLs
curl -I https://chekkd.com/robots.txt
curl -I https://chekkd.com/sitemap.xml
curl -I https://chekkd.com/og-image.png
```

#### Social Media Validators
- **Facebook:** https://developers.facebook.com/tools/debug/
- **Twitter:** https://cards-dev.twitter.com/validator
- **LinkedIn:** https://www.linkedin.com/post-inspector/

#### SEO Validators
- **Rich Results:** https://search.google.com/test/rich-results
- **Schema.org:** https://validator.schema.org/
- **Google Search Console:** Submit sitemap at `/sitemap.xml`

### NPM Scripts

```bash
# Development
npm run dev              # Start local server on :3000
npm run start            # Start local server (any port)

# Testing
npm run test:local       # Alias for dev
npm run test:seo         # Test SEO files exist

# Validation (opens URLs)
npm run validate:schema  # Schema.org validator
npm run validate:og      # Social media validators

# Deployment
npm run deploy           # Deploy to production
npm run deploy:preview   # Deploy preview
```

### Analytics Dashboard Access

- **Google Analytics 4:** https://analytics.google.com
  - Property: CHEKKD Website
  - Stream: chekkd.com
- **Vercel Analytics:** https://vercel.com/dashboard → Project → Analytics
- **Cloudflare Analytics:** https://dash.cloudflare.com → Analytics → Web Analytics

### Performance Impact

**Before Analytics Implementation:**
- HTML size: 165KB
- Page load: ~1.2s

**After Analytics Implementation:**
- HTML size: 173KB (+4.8%)
- Additional resources: ~60KB (external scripts)
- Page load: ~1.4s (+200ms)

All analytics scripts use `async` or `defer` for non-blocking load.

### Expected SEO Results Timeline

**Immediate (0-7 days):**
- Cookie banner functional
- All analytics platforms tracking
- Meta description appears in Google
- Social shares show OG image

**Short-term (1-4 weeks):**
- 5-10% increase in organic CTR
- Social sharing engagement improves
- Google indexes structured data

**Medium-term (1-3 months):**
- Rich results in SERP
- AI search engines cite CHEKKD
- Improved Perplexity/ChatGPT visibility

**Long-term (3-12 months):**
- Google sitelinks for "CHEKKD" searches
- Knowledge panel with org details
- AI Overview appearances (15%+ of queries)

---

**Built with ❤️ by the Handshake team** | Launched at Sundance Film Festival 2026
