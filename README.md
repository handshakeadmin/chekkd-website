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

---

**Built with ❤️ by the Handshake team** | Launched at Sundance Film Festival 2026
