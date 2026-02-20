#!/bin/bash
# SEO Validation Script for CHEKKD Website
# Checks all SEO optimizations before deployment

echo "🔍 CHEKKD SEO Validation"
echo "======================="
echo ""

ERRORS=0
WARNINGS=0

# Check file exists
if [ ! -f "out/index.html" ]; then
    echo "❌ Error: out/index.html not found"
    exit 1
fi

echo "📄 Checking meta tags..."

# Check title length
TITLE=$(grep -o '<title>[^<]*' out/index.html | sed 's/<title>//')
TITLE_LENGTH=${#TITLE}
if [ $TITLE_LENGTH -lt 50 ]; then
    echo "⚠️  Title too short: $TITLE_LENGTH chars (optimal: 50-60)"
    WARNINGS=$((WARNINGS + 1))
elif [ $TITLE_LENGTH -gt 70 ]; then
    echo "⚠️  Title too long: $TITLE_LENGTH chars (optimal: 50-60)"
    WARNINGS=$((WARNINGS + 1))
else
    echo "✅ Title length: $TITLE_LENGTH chars"
fi

# Check meta description exists and length
DESC=$(grep 'meta name="description"' out/index.html | grep -o 'content="[^"]*"' | sed 's/content="//;s/"//')
DESC_LENGTH=${#DESC}
if [ -z "$DESC" ]; then
    echo "❌ Meta description missing"
    ERRORS=$((ERRORS + 1))
elif [ $DESC_LENGTH -lt 120 ]; then
    echo "⚠️  Description too short: $DESC_LENGTH chars (optimal: 120-160)"
    WARNINGS=$((WARNINGS + 1))
elif [ $DESC_LENGTH -gt 160 ]; then
    echo "⚠️  Description too long: $DESC_LENGTH chars (optimal: 120-160)"
    WARNINGS=$((WARNINGS + 1))
else
    echo "✅ Meta description length: $DESC_LENGTH chars"
fi

# Check H1 exists
H1_COUNT=$(grep -c '<h1' out/index.html || echo "0")
if [ $H1_COUNT -eq 0 ]; then
    echo "❌ No H1 tag found"
    ERRORS=$((ERRORS + 1))
elif [ $H1_COUNT -gt 1 ]; then
    echo "⚠️  Multiple H1 tags found: $H1_COUNT (should be 1)"
    WARNINGS=$((WARNINGS + 1))
else
    echo "✅ H1 tag present (count: 1)"
fi

# Check OG image
if grep -q 'og:image.*chekkd.com/og-image.png' out/index.html; then
    echo "✅ OG image meta tag present"
else
    echo "❌ OG image meta tag missing or incorrect"
    ERRORS=$((ERRORS + 1))
fi

# Check Schema.org logo
if grep -q 'chekkd-logo-1200x1200.png' out/index.html; then
    echo "✅ Schema.org logo reference present"
else
    echo "❌ Schema.org logo reference missing or incorrect"
    ERRORS=$((ERRORS + 1))
fi

echo ""
echo "📦 Checking asset files..."

# Check OG image exists
if [ -f "out/og-image.png" ]; then
    SIZE=$(du -h out/og-image.png | cut -f1)
    echo "✅ OG image exists ($SIZE)"
else
    echo "❌ OG image missing: out/og-image.png"
    ERRORS=$((ERRORS + 1))
fi

# Check logo exists
if [ -f "out/images/chekkd-logo-1200x1200.png" ]; then
    SIZE=$(du -h out/images/chekkd-logo-1200x1200.png | cut -f1)
    echo "✅ Logo exists ($SIZE)"
else
    echo "❌ Logo missing: out/images/chekkd-logo-1200x1200.png"
    ERRORS=$((ERRORS + 1))
fi

# Check sitemap
if [ -f "out/sitemap.xml" ]; then
    echo "✅ Sitemap exists"
    if grep -q 'chekkdlounge.com' out/sitemap.xml; then
        echo "⚠️  Sitemap contains external domain (chekkdlounge.com)"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo "❌ Sitemap missing: out/sitemap.xml"
    ERRORS=$((ERRORS + 1))
fi

echo ""
echo "📊 Content checks..."

# Check if "identity verification platform" is in description
if echo "$DESC" | grep -q "identity verification platform"; then
    echo "✅ Key phrase 'identity verification platform' in description"
else
    echo "⚠️  Key phrase 'identity verification platform' NOT in description"
    WARNINGS=$((WARNINGS + 1))
fi

# Check if dating is de-emphasized
if echo "$DESC" | grep -E "dating" | grep -v "marketplaces.*dating"; then
    echo "⚠️  'Dating' may still be too prominent in description"
    WARNINGS=$((WARNINGS + 1))
else
    echo "✅ Messaging properly prioritizes marketplaces/hiring"
fi

echo ""
echo "═══════════════════════"
echo "Summary:"
echo "  ❌ Errors: $ERRORS"
echo "  ⚠️  Warnings: $WARNINGS"

if [ $ERRORS -eq 0 ]; then
    echo ""
    echo "✅ Validation passed! Ready to deploy."
    echo "   Run: bash deploy-seo.sh"
    exit 0
else
    echo ""
    echo "❌ Validation failed. Fix errors before deploying."
    exit 1
fi
