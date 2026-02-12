#!/usr/bin/env python3
"""
Update index.html with analytics and SEO optimizations
"""

def update_html():
    with open('/Users/matthewschwen/projects/chekkd-website/out/index.html', 'r', encoding='utf-8') as f:
        content = f.read()

    # 1. Fix canonical URL
    content = content.replace(
        '<link rel="canonical" href="index.html" />',
        '<link rel="canonical" href="https://chekkd.com/" />'
    )

    # 2. Add SEO meta tags after canonical
    seo_meta_tags = '''<link rel="canonical" href="https://chekkd.com/" />
<link rel="sitemap" type="application/xml" href="/sitemap.xml">
<meta name="description" content="Verify identities instantly with CHEKKD's TrustBadge. Secure peer-to-peer transactions for marketplaces, dating, hiring. Join the waitlist today.">

<!-- Open Graph / Facebook -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://chekkd.com/">
<meta property="og:title" content="CHEKKD – Trust, Verified. | Instant Identity Verification">
<meta property="og:description" content="Verify identities instantly with CHEKKD's TrustBadge. Secure peer-to-peer transactions for marketplaces, dating, hiring. Join the waitlist today.">
<meta property="og:image" content="https://chekkd.com/og-image.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="CHEKKD - Trust, Verified. Instant Identity Verification Platform">
<meta property="og:site_name" content="CHEKKD">
<meta property="og:locale" content="en_US">

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:url" content="https://chekkd.com/">
<meta name="twitter:title" content="CHEKKD – Trust, Verified. | Instant Identity Verification">
<meta name="twitter:description" content="Verify identities instantly with CHEKKD's TrustBadge. Secure peer-to-peer transactions for marketplaces, dating, hiring. Join the waitlist today.">
<meta name="twitter:image" content="https://chekkd.com/og-image.png">
<meta name="twitter:image:alt" content="CHEKKD - Trust, Verified. Instant Identity Verification Platform">

<!-- Additional SEO -->
<meta name="author" content="CHEKKD">
<meta name="theme-color" content="#8e4aff">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">'''

    content = content.replace(
        '<link rel="canonical" href="https://chekkd.com/" />',
        seo_meta_tags
    )

    # 3. Update favicon links (replace old WordPress favicon section)
    old_favicon = '''<link rel="icon" href="wp-content/uploads/2026/01/cropped-favicon-32x32.jpg" sizes="32x32" />
<link rel="icon" href="wp-content/uploads/2026/01/cropped-favicon-192x192.jpg" sizes="192x192" />
<link rel="apple-touch-icon" href="wp-content/uploads/2026/01/cropped-favicon-180x180.jpg" />
<meta name="msapplication-TileImage" content="https://chekkd.com/wp-content/uploads/2026/01/cropped-favicon-270x270.jpg" />'''

    new_favicon = '''<link rel="icon" href="/favicon.svg" type="image/svg+xml">
<link rel="icon" href="/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/favicon-192x192.png" sizes="192x192" type="image/png">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="manifest" href="/site.webmanifest">'''

    content = content.replace(old_favicon, new_favicon)

    # 4. Add Schema.org JSON-LD before </head>
    schema_jsonld = '''
<!-- Schema.org Structured Data -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Organization",
      "@id": "https://chekkd.com/#organization",
      "name": "CHEKKD",
      "url": "https://chekkd.com",
      "logo": {
        "@type": "ImageObject",
        "url": "https://chekkd.com/wp-content/uploads/2026/01/chekkd-logo-1-1.png",
        "width": 3006,
        "height": 723
      },
      "description": "CHEKKD is a rapid identity verification and reliability scoring platform for secure peer-to-peer transactions across marketplaces, dating, hiring, and more.",
      "foundingDate": "2026",
      "slogan": "Trust, Verified.",
      "brand": {
        "@type": "Brand",
        "name": "CHEKKD"
      },
      "contactPoint": {
        "@type": "ContactPoint",
        "email": "support@chekkd.com",
        "contactType": "Customer Service"
      },
      "sameAs": [
        "https://chekkdlounge.com"
      ]
    },
    {
      "@type": "WebSite",
      "@id": "https://chekkd.com/#website",
      "url": "https://chekkd.com",
      "name": "CHEKKD",
      "description": "Trust verification platform for peer-to-peer transactions",
      "publisher": {
        "@id": "https://chekkd.com/#organization"
      },
      "potentialAction": {
        "@type": "ReadAction",
        "target": {
          "@type": "EntryPoint",
          "urlTemplate": "https://chekkdlounge.com/s/matthew-schwen"
        },
        "name": "Join Waitlist"
      }
    },
    {
      "@type": "WebPage",
      "@id": "https://chekkd.com/#webpage",
      "url": "https://chekkd.com",
      "name": "CHEKKD – Trust, Verified. | Instant Identity Verification",
      "description": "Verify identities instantly with CHEKKD's TrustBadge. Secure peer-to-peer transactions for marketplaces, dating, hiring.",
      "isPartOf": {
        "@id": "https://chekkd.com/#website"
      },
      "about": {
        "@id": "https://chekkd.com/#organization"
      },
      "primaryImageOfPage": {
        "@type": "ImageObject",
        "url": "https://chekkd.com/og-image.png",
        "width": 1200,
        "height": 630
      }
    },
    {
      "@type": "BreadcrumbList",
      "@id": "https://chekkd.com/#breadcrumb",
      "itemListElement": [
        {
          "@type": "ListItem",
          "position": 1,
          "name": "Home",
          "item": "https://chekkd.com"
        },
        {
          "@type": "ListItem",
          "position": 2,
          "name": "Join Waitlist",
          "item": "https://chekkdlounge.com/s/matthew-schwen"
        }
      ]
    }
  ]
}
</script>

<!-- Vercel Analytics (privacy-first, no cookies) -->
<script>
  window.va = window.va || function () { (window.vaq = window.vaq || []).push(arguments); };
</script>
<script defer src="/_vercel/insights/script.js"></script>

<!-- Cloudflare Web Analytics (privacy-first) -->
<script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "dwihYz5cSazrymi5MLlt3gIgpl7z9ZWtYd1_eac1"}'></script>

</head>'''

    content = content.replace('</head>', schema_jsonld)

    # 5. Add cookie consent banner after <body tag
    # Find the <body tag (it's very long with many attributes)
    body_tag_start = content.find('<body class="home')
    if body_tag_start != -1:
        body_tag_end = content.find('>', body_tag_start)
        if body_tag_end != -1:
            cookie_consent = '''
<!-- Cookie Consent Banner -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orestbida/cookieconsent@3.0.1/dist/cookieconsent.css">
<script defer src="https://cdn.jsdelivr.net/gh/orestbida/cookieconsent@3.0.1/dist/cookieconsent.umd.js"></script>
<script>
  window.addEventListener('load', function() {
    const cc = initCookieConsent();
    cc.run({
      current_lang: 'en',
      autoclear_cookies: true,
      page_scripts: true,

      onFirstAction: function(user_preferences, cookie){
        if(user_preferences.accepted_categories.includes('analytics')){
          gtag('consent', 'update', {'analytics_storage': 'granted'});
        }
      },

      onChange: function(cookie, changed_preferences){
        if(changed_preferences.includes('analytics')){
          if(cc.allowedCategory('analytics')){
            gtag('consent', 'update', {'analytics_storage': 'granted'});
          } else {
            gtag('consent', 'update', {'analytics_storage': 'denied'});
          }
        }
      },

      languages: {
        'en': {
          consent_modal: {
            title: 'We use cookies',
            description: 'We use cookies to analyze our website traffic and improve your experience. You can choose to accept or reject these cookies.',
            primary_btn: {
              text: 'Accept all',
              role: 'accept_all'
            },
            secondary_btn: {
              text: 'Reject all',
              role: 'accept_necessary'
            }
          },
          settings_modal: {
            title: 'Cookie preferences',
            save_settings_btn: 'Save settings',
            accept_all_btn: 'Accept all',
            reject_all_btn: 'Reject all',
            blocks: [
              {
                title: 'Strictly necessary',
                description: 'These cookies are essential for the website to function properly.',
                toggle: {
                  value: 'necessary',
                  enabled: true,
                  readonly: true
                }
              },
              {
                title: 'Analytics cookies',
                description: 'These cookies help us understand how visitors use our website by collecting anonymous data.',
                toggle: {
                  value: 'analytics',
                  enabled: false,
                  readonly: false
                }
              }
            ]
          }
        }
      }
    });
  });
</script>
'''
            content = content[:body_tag_end + 1] + cookie_consent + content[body_tag_end + 1:]

    # 6. Add GA4 and event tracking before </body>
    analytics_scripts = '''
<!-- Google Analytics 4 -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-EK99JFRXJW"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-EK99JFRXJW', {
    'anonymize_ip': true,
    'cookie_flags': 'SameSite=None;Secure'
  });
</script>

<!-- Custom Event Tracking -->
<script>
  (function() {
    'use strict';

    function initEventTracking() {
      // Global click tracking for data-track-event elements
      document.addEventListener('click', function(e) {
        var target = e.target.closest('[data-track-event]');
        if (!target) return;

        var eventName = target.getAttribute('data-track-event');
        var eventLabel = target.getAttribute('data-event-label') || '';
        var eventValue = target.getAttribute('data-event-value') || undefined;

        // Send to GA4
        if (typeof gtag !== 'undefined') {
          gtag('event', eventName, {
            'event_label': eventLabel,
            'event_value': eventValue,
            'event_category': 'engagement'
          });
        }

        // Send to Vercel Analytics
        if (typeof window.va !== 'undefined') {
          window.va('event', eventName, {label: eventLabel});
        }
      });

      // Track scroll depth
      var scrollDepths = [25, 50, 75, 100];
      var triggered = [];
      window.addEventListener('scroll', function() {
        var scrollPercent = Math.round((window.scrollY / (document.body.scrollHeight - window.innerHeight)) * 100);
        scrollDepths.forEach(function(depth) {
          if (scrollPercent >= depth && !triggered.includes(depth)) {
            triggered.push(depth);
            if (typeof gtag !== 'undefined') {
              gtag('event', 'scroll_depth', {
                'event_category': 'engagement',
                'event_label': depth + '%'
              });
            }
          }
        });
      });
    }

    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', initEventTracking);
    } else {
      initEventTracking();
    }
  })();
</script>

<script></script></body>'''

    content = content.replace('<script></script></body>', analytics_scripts)

    # Write the updated content
    with open('/Users/matthewschwen/projects/chekkd-website/out/index.html', 'w', encoding='utf-8') as f:
        f.write(content)

    print("✓ Updated index.html successfully")
    print("  - Fixed canonical URL")
    print("  - Added SEO meta tags (description, Open Graph, Twitter Card)")
    print("  - Updated favicon links")
    print("  - Added Schema.org structured data")
    print("  - Added Vercel Analytics")
    print("  - Added Cloudflare Web Analytics")
    print("  - Added cookie consent banner")
    print("  - Added Google Analytics 4 with consent mode")
    print("  - Added custom event tracking script")

if __name__ == '__main__':
    update_html()
