#!/bin/bash
# SEO Deployment Script for CHEKKD Website
# Deploys all SEO optimization changes to production

set -e  # Exit on any error

echo "🚀 CHEKKD SEO Deployment"
echo "======================="
echo ""

# Check we're in the right directory
if [ ! -f "out/index.html" ]; then
    echo "❌ Error: Must run from project root directory"
    exit 1
fi

echo "📋 Files to deploy:"
echo "  - out/index.html (meta tags, H1, alt tags)"
echo "  - out/sitemap.xml (cleaned, updated)"
echo "  - out/og-image.png (social preview)"
echo "  - out/images/chekkd-logo-1200x1200.png (Schema.org logo)"
echo ""

# Stage changes
echo "📦 Staging changes..."
git add out/index.html
git add out/sitemap.xml
git add out/og-image.png
git add out/images/chekkd-logo-1200x1200.png

echo ""
echo "📊 Git status:"
git status --short | grep -E "(out/index.html|out/sitemap.xml|og-image.png|chekkd-logo)"

echo ""
read -p "🤔 Ready to commit and push? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "✍️  Creating commit..."
    git commit -m "feat(seo): comprehensive SEO optimization for identity verification platform

- Update meta description to emphasize identity verification platform
- Add keywords and optimize page title (58 chars)
- Add H1 tag at top with primary keywords
- Update hero H2 to prioritize marketplaces/hiring over dating
- Fix Schema.org logo to use proper square asset (1200x1200)
- Add descriptive alt tags to main images
- Deploy proper OG image for social sharing (2880x1472)
- Clean sitemap (remove external URLs, add image sitemap)
- Update all Open Graph and Twitter Card tags

Expected impact: Improved Google search results, logo display in searches, better CTR"

    echo ""
    echo "🚢 Pushing to remote..."
    git push

    echo ""
    echo "✅ Deployment complete!"
    echo ""
    echo "📍 Next steps:"
    echo "  1. Check Vercel dashboard for build status"
    echo "  2. Visit https://chekkd.com to verify changes live"
    echo "  3. Add Google Search Console verification tag"
    echo "  4. Submit sitemap and request indexing"
    echo ""
else
    echo ""
    echo "⏸️  Deployment cancelled. Changes are staged but not committed."
    echo "   Run 'git reset' to unstage if needed."
    echo ""
fi
