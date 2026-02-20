#!/usr/bin/env python3
"""
Add tracking attributes to CTA buttons
"""

def add_tracking_attributes():
    with open('/Users/matthewschwen/projects/chekkd-website/out/index.html', 'r', encoding='utf-8') as f:
        content = f.read()

    # 1. Navigation menu "Join Waitlist"
    content = content.replace(
        '<a href="https://chekkdlounge.com/s/matthew-schwen"><span class="menu-title-text">',
        '<a href="https://chekkdlounge.com/s/matthew-schwen" data-track-event="nav_click" data-event-label="nav_join_waitlist"><span class="menu-title-text">'
    )

    # 2. Hero CTA "Join the Waitlist" button
    content = content.replace(
        '<a  class="link_text" role="button" href="https://chekkdlounge.com/s/matthew-schwen"><span class="text">Join the Waitlist</span>',
        '<a  class="link_text" role="button" href="https://chekkdlounge.com/s/matthew-schwen" data-track-event="cta_click" data-event-label="hero_join_waitlist"><span class="text">Join the Waitlist</span>'
    )

    # 3. Footer "Join Waitlist"
    # Find the footer link more carefully - it's in a different section
    import re
    # Match footer link pattern
    footer_pattern = r'(<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1286"><a href="https://chekkdlounge\.com/s/matthew-schwen">Join Waitlist</a>)'
    footer_replacement = r'<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1286"><a href="https://chekkdlounge.com/s/matthew-schwen" data-track-event="footer_click" data-event-label="footer_join_waitlist">Join Waitlist</a>'

    content = re.sub(footer_pattern, footer_replacement, content)

    # Write updated content
    with open('/Users/matthewschwen/projects/chekkd-website/out/index.html', 'w', encoding='utf-8') as f:
        f.write(content)

    print("✓ Added tracking attributes to CTA buttons:")
    print("  - Navigation menu 'Join Waitlist' -> nav_click")
    print("  - Hero CTA 'Join the Waitlist' -> cta_click")
    print("  - Footer 'Join Waitlist' -> footer_click")

if __name__ == '__main__':
    add_tracking_attributes()
