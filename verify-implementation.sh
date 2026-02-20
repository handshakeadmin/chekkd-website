#!/bin/bash
# Verification script for analytics and SEO implementation

echo "🔍 CHEKKD Website - Analytics & SEO Verification"
echo "================================================"
echo ""

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check files exist
echo "📁 Checking files..."
files=(
    "out/index.html"
    "out/robots.txt"
    "out/sitemap.xml"
    "out/site.webmanifest"
    "out/favicon.svg"
    "out/favicon-32x32.png"
    "out/favicon-192x192.png"
    "out/apple-touch-icon.png"
    "out/og-image.png"
    "out/og-image-square.png"
)

all_files_exist=true
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo -e "  ${GREEN}✓${NC} $file"
    else
        echo -e "  ${RED}✗${NC} $file (missing)"
        all_files_exist=false
    fi
done

echo ""

# Check HTML contains required elements
echo "🔍 Checking HTML content..."
html_checks=(
    "G-EK99JFRXJW|GA4 Measurement ID"
    "dwihYz5cSazrymi5MLlt3gIgpl7z9ZWtYd1_eac1|Cloudflare Token"
    "gtag\('consent', 'default'|Google Consent Mode v2"
    "og:image|Open Graph tags"
    "twitter:card|Twitter Card tags"
    "@type.*Organization|Schema.org structured data"
    "cookieconsent|Cookie consent banner"
    "data-track-event|Event tracking attributes"
    "rel=\"canonical\" href=\"https://chekkd.com/\"|Canonical URL"
    "/sitemap.xml|Sitemap reference"
)

all_html_valid=true
for check in "${html_checks[@]}"; do
    pattern="${check%%|*}"
    description="${check##*|}"
    if grep -q "$pattern" out/index.html; then
        echo -e "  ${GREEN}✓${NC} $description"
    else
        echo -e "  ${RED}✗${NC} $description (not found)"
        all_html_valid=false
    fi
done

echo ""

# Check file sizes
echo "📊 File sizes:"
echo "  index.html: $(du -h out/index.html | cut -f1)"
echo "  og-image.png: $(du -h out/og-image.png | cut -f1)"
echo "  og-image-square.png: $(du -h out/og-image-square.png | cut -f1)"

echo ""

# Final status
echo "================================"
if $all_files_exist && $all_html_valid; then
    echo -e "${GREEN}✓ All checks passed!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Test locally: npm run dev"
    echo "2. Deploy: git add . && git commit -m \"feat(seo): add analytics and SEO\" && git push"
    echo "3. Verify production: https://chekkd.com"
    echo "4. Submit sitemap to Google Search Console"
    exit 0
else
    echo -e "${RED}✗ Some checks failed${NC}"
    echo "Please review the errors above"
    exit 1
fi
