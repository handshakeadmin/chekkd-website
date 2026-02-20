# Google Tag Manager Setup Guide - CHEKKD

**GTM Container ID**: GTM-T87D3R49
**GA4 Measurement ID**: G-EK99JFRXJW

---

## Part 1: Verify GTM is Working

### Step 1: Test Preview Mode

1. Go to GTM: https://tagmanager.google.com/
2. Click **"Preview"** (top right)
3. Enter URL: `https://chekkd.com`
4. Click **"Connect"**

**Expected result:**
- ✅ Green "Connected" message
- ✅ Your website opens in new tab
- ✅ Debugger panel appears showing tags firing

**If it doesn't connect:**
- Wait 5 minutes for deployment
- Clear browser cache
- Try again

---

## Part 2: Track "Join the Waitlist" Button Clicks

### What We're Tracking:
- Every click on the "Join the Waitlist" button
- Which button they clicked (there might be multiple)
- Where on the page it's located

### Step 1: Create a Click Trigger

**In GTM dashboard:**

1. Click **"Triggers"** in left sidebar
2. Click **"New"** button (top right)
3. Click the pencil icon to name it: **`Click - Join Waitlist Button`**

4. **Click trigger configuration box** (top)
5. Choose: **"Click - All Elements"**

6. In **"This trigger fires on"** section:
   - Select: **"Some Clicks"**

7. Add these conditions (click "+ Add" for each):

   **Option A** (Recommended - More specific):
   - **Click Text** | **contains** | `Join the Waitlist`
   - AND
   - **Click URL** | **contains** | `chekkdlounge.com`

   **Option B** (Simpler but less specific):
   - **Click Text** | **contains** | `Join the Waitlist`

8. Click **"Save"**

---

### Step 2: Create a GA4 Event Tag

**Still in GTM:**

1. Click **"Tags"** in left sidebar
2. Click **"New"** button
3. Name it: **`GA4 - Join Waitlist Click`**

4. **Click tag configuration box**
5. Choose: **"Google Analytics: GA4 Event"**

6. **Configuration Tag**: Choose **"Google Analytics: GA4 Configuration"** if it exists
   - If it doesn't exist, we'll create it in Step 3

7. **Event Name**: Enter `join_waitlist_click`

8. **Event Parameters** (click "Add Row" for each):

   | Parameter Name | Value |
   |---------------|-------|
   | `button_text` | `{{Click Text}}` |
   | `button_url` | `{{Click URL}}` |
   | `page_location` | `{{Page URL}}` |

9. **Triggering**: Select the trigger you created: **"Click - Join Waitlist Button"**

10. Click **"Save"**

---

### Step 3: Create GA4 Configuration Tag (If Needed)

**If you don't have a GA4 Configuration tag:**

1. Click **"Tags"** → **"New"**
2. Name it: **`GA4 - Configuration`**
3. Choose: **"Google Analytics: GA4 Configuration"**
4. **Measurement ID**: Enter `G-EK99JFRXJW`
5. **Triggering**: Select **"All Pages"**
6. Click **"Save"**

**Then go back and edit** the "GA4 - Join Waitlist Click" tag to use this configuration.

---

### Step 4: Test Your Setup

1. Click **"Preview"** (top right)
2. Connect to your site: `https://chekkd.com`
3. **In the debugger**, you should see:
   - Tags firing on page load
   - Your GA4 Configuration tag

4. **Click the "Join the Waitlist" button** on your site
5. **In the debugger**, you should see:
   - Your trigger fires: "Click - Join Waitlist Button"
   - Your tag fires: "GA4 - Join Waitlist Click"
   - Event data shows button_text, button_url, etc.

**If it works**: ✅ Great! Continue to Step 5
**If it doesn't work**: Check troubleshooting section below

---

### Step 5: Publish Your Changes

1. Click **"Submit"** (top right, next to Preview)
2. **Version Name**: `Button Click Tracking`
3. **Version Description** (optional): `Track Join the Waitlist button clicks`
4. Click **"Publish"**

✅ **Done!** Your button clicks are now being tracked.

---

## Part 3: See Button Clicks in Google Analytics

### Real-Time View (See Clicks Immediately)

1. Go to Google Analytics: https://analytics.google.com/
2. Click **"Reports"** → **"Realtime"**
3. Open your site in another tab: https://chekkd.com
4. Click **"Join the Waitlist"**
5. Go back to Analytics
6. Look at **"Event count by Event name"**
7. You should see **`join_waitlist_click`** appear!

### Historical View (See All Clicks Over Time)

1. In Google Analytics, click **"Reports"** → **"Engagement"** → **"Events"**
2. You'll see a table of all events
3. Look for **`join_waitlist_click`**
4. Click on it to see:
   - Total clicks
   - Unique users who clicked
   - When they clicked
   - Which page they were on

---

## Part 4: Track Drop-Offs (Conversion Funnel)

This shows you where people leave without clicking the button.

### Step 1: Create a Funnel Exploration

1. In Google Analytics, click **"Explore"** (left sidebar)
2. Click **"Blank"** template
3. Choose **"Funnel exploration"**

### Step 2: Set Up Funnel Steps

**Configure these steps:**

| Step # | Event | Description |
|--------|-------|-------------|
| 1 | `page_view` | Visited homepage |
| 2 | `scroll` (depth: 50%) | Scrolled halfway down |
| 3 | `scroll` (depth: 75%) | Scrolled to CTA area |
| 4 | `join_waitlist_click` | Clicked button |
| 5 | `page_view` (URL contains chekkdlounge) | Landed on waitlist page |

### Step 3: Add Conditions

1. **Step 1**:
   - Event name = `page_view`
   - page_location contains `chekkd.com`
   - page_location does NOT contain `chekkdlounge`

2. **Step 2**:
   - Event name = `scroll`
   - percent_scrolled ≥ 50

3. **Step 3**:
   - Event name = `scroll`
   - percent_scrolled ≥ 75

4. **Step 4**:
   - Event name = `join_waitlist_click`

5. **Step 5**:
   - Event name = `page_view`
   - page_location contains `chekkdlounge.com`

### Step 4: Analyze Drop-Offs

The funnel will show:
- **100 visitors** started
- **80 visitors** scrolled 50% (20% dropped off)
- **60 visitors** scrolled 75% (20% more dropped off)
- **25 visitors** clicked button (35% dropped off)
- **20 visitors** completed signup (5% dropped off)

**Key insights:**
- If many drop off at Step 2-3: CTA isn't visible enough
- If many drop off at Step 4: Button text/design needs improvement
- If many drop off at Step 5: Waitlist page has issues

---

## Part 5: Track Other Important Actions

### Track Scroll Depth (Already Built-in)

GA4 automatically tracks scroll depth (25%, 50%, 75%, 90%).

**To see scroll data:**
1. Go to **Reports** → **Engagement** → **Events**
2. Look for **`scroll`** event
3. Click it to see how far people scroll

### Track Outbound Link Clicks

If you want to track when people leave your site:

1. **Create Trigger**: "Click - All Elements"
2. **Condition**: Click URL does NOT contain `chekkd.com`
3. **Create Tag**: GA4 Event with name `outbound_click`
4. **Event Parameters**:
   - `link_url` = `{{Click URL}}`
   - `link_text` = `{{Click Text}}`

### Track Video Plays (If You Add Videos)

1. **Create Trigger**: "YouTube Video"
2. **Capture**: "Start" and "Complete"
3. **Create Tags**: GA4 Events for video_start and video_complete

---

## Troubleshooting

### Preview Mode Won't Connect

**Problem**: "Failed to connect" message

**Solutions:**
1. Wait 5 minutes for deployment
2. Clear browser cache (Cmd+Shift+R on Mac)
3. Try different browser (Chrome works best)
4. Check that GTM code is on site: view-source:https://chekkd.com and search for "GTM-T87D3R49"
5. Disable browser extensions (especially ad blockers)

### Button Clicks Not Showing in Debugger

**Problem**: Click the button but nothing fires

**Solutions:**
1. Check trigger conditions - might be too specific
2. Use **"Click Element"** instead of **"Click Text"**
3. Try simpler trigger: Fire on "All Clicks" temporarily to test
4. Check that button has the right class/text
5. Use built-in variables: Click Element, Click Classes, Click ID

### Button Clicks Not Showing in Analytics

**Problem**: Works in Preview but not in real Analytics

**Solutions:**
1. Wait 24-48 hours for data to appear in reports
2. Check **Realtime** view instead (shows immediately)
3. Verify GA4 Measurement ID is correct: G-EK99JFRXJW
4. Check that tags were published (not just saved)
5. Test in incognito window without ad blockers

### "No Recent Data" in GTM

**Problem**: Container shows "No Recent Data"

**This is normal if:**
- GTM was just installed (takes 24 hours to show data)
- No visitors have been to your site yet
- Preview mode is the only way to test immediately

**Solution**: Use Preview mode to test, ignore the "No Recent Data" message

---

## Best Practices

### Naming Conventions

Use consistent naming for easy management:

**Triggers:**
- Format: `[Type] - [Description]`
- Examples:
  - `Click - Join Waitlist Button`
  - `Pageview - Thank You Page`
  - `Scroll - 75%`

**Tags:**
- Format: `[Platform] - [Event Name]`
- Examples:
  - `GA4 - Join Waitlist Click`
  - `GA4 - Form Submission`
  - `GA4 - Video Play`

**Variables:**
- Format: `[Type] - [Description]`
- Examples:
  - `DLV - User ID`
  - `JS - Button Color`
  - `Constant - GA4 ID`

### Testing Checklist

Before publishing, always:
- [ ] Test in Preview mode
- [ ] Click button to verify trigger fires
- [ ] Check event data looks correct
- [ ] Test on mobile device
- [ ] Test with ad blocker disabled
- [ ] Verify GA4 receives data in Realtime

### Version Control

When publishing:
- Use descriptive version names
- Add notes about what changed
- Keep track of major changes
- Can always revert to previous version

---

## Quick Reference

### Important URLs

- **GTM Dashboard**: https://tagmanager.google.com/
- **Google Analytics**: https://analytics.google.com/
- **Tag Assistant**: https://tagassistant.google.com/
- **GA4 Event Builder**: https://ga-dev-tools.google/ga4/event-builder/

### Key Event Names

| Event Name | What It Tracks |
|-----------|----------------|
| `page_view` | Page loads (automatic) |
| `scroll` | Scroll depth (automatic) |
| `join_waitlist_click` | Button clicks (custom) |
| `session_start` | New session (automatic) |
| `first_visit` | First time visitor (automatic) |
| `click` | All clicks (automatic in some setups) |

### Common Variables

| Variable | Purpose |
|----------|---------|
| `{{Click Text}}` | Text of clicked element |
| `{{Click URL}}` | URL of clicked link |
| `{{Click Element}}` | HTML element clicked |
| `{{Page URL}}` | Current page URL |
| `{{Page Path}}` | Path portion of URL |
| `{{Referrer}}` | Previous page URL |

---

## Next Steps

Once button tracking is working:

1. **Add more events**:
   - Track navigation menu clicks
   - Track footer link clicks
   - Track social media icon clicks

2. **Set up conversions** in GA4:
   - Mark `join_waitlist_click` as a conversion
   - This shows in your main reports

3. **Create audiences**:
   - People who clicked but didn't sign up
   - Remarket to them later

4. **Set up alerts**:
   - Email notification when clicks drop
   - Monitor conversion rate weekly

---

## Support Resources

- **GTM Help**: https://support.google.com/tagmanager
- **GA4 Help**: https://support.google.com/analytics
- **GTM Community**: https://www.reddit.com/r/GoogleTagManager/
- **GA4 Community**: https://www.reddit.com/r/GoogleAnalytics/

---

**Questions?** Review this guide step-by-step or ask for help!
