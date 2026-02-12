# Email Forwarding Setup: letshandshake.io → chekkd.com

## Overview

You need to forward emails from `@letshandshake.io` to `@chekkd.com` so you only manage one set of accounts.

**Current Setup:**
- **Primary Domain:** chekkd.com (Cloudflare DNS)
- **Legacy Domain:** letshandshake.io (Vercel DNS)
- **Email Provider:** Google Workspace

## Option 1: Google Workspace Email Routing (Recommended)

Since you're already using Google Workspace, use it for forwarding.

### Steps:

1. **Add letshandshake.io to Google Workspace**
   - Go to [Google Admin Console](https://admin.google.com)
   - Navigate to: Account → Domains → Add a domain
   - Add `letshandshake.io` as an alias domain
   - Follow verification steps (add TXT record to Vercel DNS)

2. **Set up Email Forwarding**
   - Go to: Apps → Google Workspace → Gmail → Routing
   - Click "Add Route" or "Configure"
   - Create rule:
     - **From:** `*@letshandshake.io`
     - **To:** Change recipient to `{same_username}@chekkd.com`
   - Example: `admin@letshandshake.io` → `admin@chekkd.com`

3. **Add MX Records to Vercel DNS**
   ```
   Type: MX
   Priority: 1
   Value: ASPMX.L.GOOGLE.COM

   Type: MX
   Priority: 5
   Value: ALT1.ASPMX.L.GOOGLE.COM

   Type: MX
   Priority: 5
   Value: ALT2.ASPMX.L.GOOGLE.COM

   Type: MX
   Priority: 10
   Value: ALT3.ASPMX.L.GOOGLE.COM

   Type: MX
   Priority: 10
   Value: ALT4.ASPMX.L.GOOGLE.COM
   ```

## Option 2: Cloudflare Email Routing (Free & Simple)

If you want a simpler setup without adding letshandshake.io to Google Workspace.

### Steps:

1. **Transfer letshandshake.io to Cloudflare**
   - Log into Cloudflare
   - Add `letshandshake.io` as a new site
   - Update nameservers at your domain registrar

2. **Enable Email Routing**
   - Go to: Email → Email Routing
   - Click "Get started"
   - Verify domain (automatic)

3. **Create Forwarding Rules**
   - Click "Create address"
   - Add rules:
     - `admin@letshandshake.io` → `admin@chekkd.com`
     - `support@letshandshake.io` → `support@chekkd.com`
     - Catch-all: `*@letshandshake.io` → `support@chekkd.com`

4. **Verify Destination Emails**
   - Cloudflare will send verification emails to your @chekkd.com addresses
   - Click the verification links

## Option 3: Keep Everything Separate (Not Recommended)

Keep managing both domains independently in Google Workspace. This means:
- Double the admin work
- Confusion about which email to use
- More cost (if paying per domain)

## Recommended Email Structure

Once forwarding is set up, use these @chekkd.com addresses:

| Purpose | Email Address |
|---------|---------------|
| Customer Support | support@chekkd.com |
| General Inquiries | info@chekkd.com |
| Sales | sales@chekkd.com |
| Admin/Technical | admin@chekkd.com |
| No-reply emails | noreply@chekkd.com |

All corresponding @letshandshake.io emails will forward to these.

## Testing

After setup, test by:
1. Sending an email to `admin@letshandshake.io`
2. Verify it arrives at `admin@chekkd.com`
3. Reply from `@chekkd.com` address

## DNS Propagation

- MX record changes take 1-24 hours to propagate
- Use https://mxtoolbox.com to verify MX records
- Test with: https://www.mail-tester.com

## Current Status

✅ Website updated to use `support@chekkd.com`
- Updated: out/index.html (structured data)
- Updated: update-html.py (source script)
- Updated: README.md (documentation)

⏳ Next: Set up email forwarding (choose option above)
