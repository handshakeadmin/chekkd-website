#!/bin/bash

# Signup Form Implementation Verification Script
# Checks that the signup form was properly implemented

echo "=========================================="
echo "CHEKKD Signup Form Verification"
echo "=========================================="
echo ""

HTML_FILE="/Users/matthewschwen/projects/chekkd-website/out/index.html"

# Check if file exists
if [ ! -f "$HTML_FILE" ]; then
    echo "❌ ERROR: index.html not found at $HTML_FILE"
    exit 1
fi

echo "✓ Found index.html"
echo ""

# Check for CSS styles
echo "Checking CSS Implementation..."
if grep -q "chekkd-signup-form-css" "$HTML_FILE"; then
    echo "✓ CSS styles added"
else
    echo "❌ CSS styles NOT found"
fi

if grep -q ".screen-reader-text" "$HTML_FILE"; then
    echo "✓ Accessibility CSS present"
else
    echo "❌ Accessibility CSS missing"
fi

if grep -q "@media only screen and (max-width: 999px)" "$HTML_FILE" | grep -q "chekkd-signup-form"; then
    echo "✓ Responsive CSS present"
else
    echo "⚠️  Responsive CSS may be missing"
fi

echo ""

# Check for HTML structure
echo "Checking HTML Structure..."
if grep -q 'id="signup-form-section"' "$HTML_FILE"; then
    echo "✓ Signup form section present"
else
    echo "❌ Signup form section NOT found"
fi

if grep -q 'id="chekkd-signup-form"' "$HTML_FILE"; then
    echo "✓ Form element present"
else
    echo "❌ Form element NOT found"
fi

# Check for form fields
echo ""
echo "Checking Form Fields..."
if grep -q 'id="first-name"' "$HTML_FILE"; then
    echo "✓ First name field"
else
    echo "❌ First name field missing"
fi

if grep -q 'id="last-name"' "$HTML_FILE"; then
    echo "✓ Last name field"
else
    echo "❌ Last name field missing"
fi

if grep -q 'id="email"' "$HTML_FILE"; then
    echo "✓ Email field"
else
    echo "❌ Email field missing"
fi

if grep -q 'id="phone"' "$HTML_FILE"; then
    echo "✓ Phone field"
else
    echo "❌ Phone field missing"
fi

# Check for button
echo ""
echo "Checking Submit Button..."
if grep -q 'class="chekkd-signup-button"' "$HTML_FILE"; then
    echo "✓ Submit button present"
else
    echo "❌ Submit button missing"
fi

# Check for design elements
echo ""
echo "Checking Design Elements..."
if grep -q 'background-color: #8e4aff' "$HTML_FILE"; then
    echo "✓ Brand purple background (#8e4aff)"
else
    echo "❌ Brand purple background missing"
fi

if grep -q "font-family: 'Open Sans'" "$HTML_FILE"; then
    echo "✓ Open Sans font family"
else
    echo "❌ Open Sans font family missing"
fi

if grep -q 'border-radius: 100px' "$HTML_FILE"; then
    echo "✓ Pill-shaped button (100px border-radius)"
else
    echo "❌ Pill-shaped button styling missing"
fi

# Check for accessibility
echo ""
echo "Checking Accessibility..."
if grep -q 'aria-required="true"' "$HTML_FILE"; then
    echo "✓ ARIA attributes present"
else
    echo "❌ ARIA attributes missing"
fi

if grep -q 'class="screen-reader-text"' "$HTML_FILE"; then
    echo "✓ Screen reader labels"
else
    echo "❌ Screen reader labels missing"
fi

# Check form placement
echo ""
echo "Checking Form Placement..."
if grep -q "nectar_hook_global_section_footer" "$HTML_FILE"; then
    # Check if signup form appears before footer
    form_line=$(grep -n 'id="signup-form-section"' "$HTML_FILE" | cut -d: -f1)
    footer_line=$(grep -n "nectar_hook_global_section_footer" "$HTML_FILE" | cut -d: -f1)

    if [ ! -z "$form_line" ] && [ ! -z "$footer_line" ] && [ "$form_line" -lt "$footer_line" ]; then
        echo "✓ Form correctly placed before footer"
    else
        echo "⚠️  Form placement may be incorrect"
    fi
else
    echo "⚠️  Could not verify footer location"
fi

echo ""
echo "=========================================="
echo "Verification Complete!"
echo "=========================================="
echo ""
echo "Next Steps:"
echo "1. Run 'npm run dev' to start local server"
echo "2. Open browser to http://localhost:3000"
echo "3. Scroll to bottom to see signup form"
echo "4. Test form fields and submit button"
echo "5. Test responsive design (resize browser)"
echo ""
