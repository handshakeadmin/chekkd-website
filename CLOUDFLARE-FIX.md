# Cloudflare DNS Fix for chekkd.com

## Current Issue
- `chekkd.com` (apex) → 216.150.1.1 (GoDaddy parking) ❌
- `www.chekkd.com` → Vercel CNAME ✅ (already correct)

## Fix Required

Go to: https://dash.cloudflare.com → chekkd.com → DNS → Records

### Change This A Record:

**BEFORE:**
```
Type: A
Name: chekkd.com (or @)
IPv4 address: 216.150.1.1
Proxy status: OFF (gray cloud)
```

**AFTER:**
```
Type: A
Name: chekkd.com (or @)
IPv4 address: 76.76.21.21
Proxy status: OFF (gray cloud)
```

### Verification (after 2-3 minutes):

```bash
# Check DNS
dig chekkd.com +short
# Should return: 76.76.21.21

# Check website
curl -I https://chekkd.com/
# Should return: HTTP/2 307 (redirect to www)

curl -I https://www.chekkd.com/
# Should return: HTTP/2 200
```

## Summary
- Only 1 record to change
- All other records (api, app, email, MX) stay the same
- www subdomain already configured correctly
- DNS stays on Cloudflare
- Website hosted on Vercel
