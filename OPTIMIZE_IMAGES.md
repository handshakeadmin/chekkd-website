# Optimize Logo & OG Images

## Current Issues

| File | Current Size | Recommended | Issue |
|------|-------------|-------------|-------|
| `og-image.png` | 2.6MB | <200KB | Too large |
| `images/chekkd-logo-1200x1200.png` | 2.2MB | <100KB | Too large |

## Why This Matters

1. **Slow page loads** - 2.6MB image delays first paint
2. **Poor SEO score** - Google penalizes large images
3. **Wasted bandwidth** - Costs more to serve
4. **Mobile performance** - Kills mobile experience

## Quick Fix

### Option 1: Use Online Tool
1. Go to https://tinypng.com or https://squoosh.app
2. Upload `og-image.png` and `chekkd-logo-1200x1200.png`
3. Download optimized versions
4. Replace the originals

### Option 2: Command Line (macOS)

```bash
# Install ImageMagick if not already installed
brew install imagemagick

# Optimize OG image (target: 1200x630px, <200KB)
magick out/og-image.png -resize 1200x630^ -gravity center -extent 1200x630 -quality 85 out/og-image-optimized.png

# Optimize logo (target: 1200x1200px, <100KB)
magick out/images/chekkd-logo-1200x1200.png -quality 85 out/images/chekkd-logo-optimized.png

# Check file sizes
ls -lh out/og-image*.png out/images/chekkd-logo*.png
```

### Option 3: Use WebP Format (Best Performance)

```bash
# Convert to WebP (even better compression)
magick out/og-image.png -quality 85 out/og-image.webp
magick out/images/chekkd-logo-1200x1200.png -quality 85 out/images/chekkd-logo-1200x1200.webp
```

## Target Sizes

- **OG Image:** 1200x630px, <200KB
- **Logo:** 1200x1200px, <100KB
- **Favicon:** Already good at 15KB

## After Optimization

1. Replace the files
2. Test with https://cards-dev.twitter.com/validator
3. Test with https://www.opengraph.xyz/
4. Clear cache and request re-index

## Priority

**Medium Priority** - Won't fix the Google search result icon immediately (that requires re-indexing), but will improve:
- Page load speed
- SEO score
- Mobile performance
- Bandwidth costs
