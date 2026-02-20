#!/bin/bash

# Signup Modal Implementation Verification Script
# Checks that the modal was properly implemented

echo "=========================================="
echo "CHEKKD Signup Modal Verification"
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

# Check for modal CSS
echo "Checking Modal CSS..."
if grep -q "chekkd-modal-overlay" "$HTML_FILE"; then
    echo "✓ Modal CSS present"
else
    echo "❌ Modal CSS NOT found"
fi

if grep -q "backdrop-filter: blur" "$HTML_FILE"; then
    echo "✓ Backdrop blur effect present"
else
    echo "❌ Backdrop blur effect missing"
fi

if grep -q "chekkd-modal-container" "$HTML_FILE"; then
    echo "✓ Modal container styles present"
else
    echo "❌ Modal container styles missing"
fi

echo ""

# Check for modal HTML
echo "Checking Modal HTML Structure..."
if grep -q 'id="chekkd-signup-modal"' "$HTML_FILE"; then
    echo "✓ Modal overlay element present"
else
    echo "❌ Modal overlay element NOT found"
fi

if grep -q 'class="chekkd-modal-close"' "$HTML_FILE"; then
    echo "✓ Close button present"
else
    echo "❌ Close button missing"
fi

if grep -q 'id="chekkd-modal-form"' "$HTML_FILE"; then
    echo "✓ Modal form present"
else
    echo "❌ Modal form NOT found"
fi

# Check for form fields
echo ""
echo "Checking Modal Form Fields..."
if grep -q 'id="modal-first-name"' "$HTML_FILE"; then
    echo "✓ First name field"
else
    echo "❌ First name field missing"
fi

if grep -q 'id="modal-last-name"' "$HTML_FILE"; then
    echo "✓ Last name field"
else
    echo "❌ Last name field missing"
fi

if grep -q 'id="modal-email"' "$HTML_FILE"; then
    echo "✓ Email field"
else
    echo "❌ Email field missing"
fi

if grep -q 'id="modal-phone"' "$HTML_FILE"; then
    echo "✓ Phone field"
else
    echo "❌ Phone field missing"
fi

# Check for validation
echo ""
echo "Checking Validation Features..."
if grep -q "validateField" "$HTML_FILE"; then
    echo "✓ Field validation function present"
else
    echo "❌ Field validation missing"
fi

if grep -q "error-message" "$HTML_FILE"; then
    echo "✓ Error message elements present"
else
    echo "❌ Error message elements missing"
fi

if grep -q 'class="error"' "$HTML_FILE" || grep -q "classList.add('error')" "$HTML_FILE"; then
    echo "✓ Error state styling"
else
    echo "❌ Error state styling missing"
fi

if grep -q 'class="success"' "$HTML_FILE" || grep -q "classList.add('success')" "$HTML_FILE"; then
    echo "✓ Success state styling"
else
    echo "❌ Success state styling missing"
fi

# Check for JavaScript functionality
echo ""
echo "Checking JavaScript Functionality..."
if grep -q "function openModal" "$HTML_FILE"; then
    echo "✓ Open modal function"
else
    echo "❌ Open modal function missing"
fi

if grep -q "function closeModal" "$HTML_FILE"; then
    echo "✓ Close modal function"
else
    echo "❌ Close modal function missing"
fi

if grep -q "addEventListener('submit'" "$HTML_FILE"; then
    echo "✓ Form submit handler"
else
    echo "❌ Form submit handler missing"
fi

if grep -q "Escape" "$HTML_FILE" && grep -q "keydown" "$HTML_FILE"; then
    echo "✓ Escape key handler"
else
    echo "❌ Escape key handler missing"
fi

# Check for background image
echo ""
echo "Checking Design Elements..."
if grep -q "park_city_1_b88bd3c928.webp" "$HTML_FILE" && grep -q "chekkd-modal" "$HTML_FILE"; then
    echo "✓ Hero background image in modal"
else
    echo "❌ Hero background image missing"
fi

if grep -q "background.*8e4aff" "$HTML_FILE" && grep -q "modal" "$HTML_FILE"; then
    echo "✓ Purple gradient overlay"
else
    echo "⚠️  Purple gradient may be missing"
fi

if grep -q "border-radius.*100px" "$HTML_FILE" && grep -q "submit" "$HTML_FILE"; then
    echo "✓ Pill-shaped button"
else
    echo "❌ Pill-shaped button styling missing"
fi

# Check for success view
echo ""
echo "Checking Success State..."
if grep -q 'id="modal-success-view"' "$HTML_FILE"; then
    echo "✓ Success view present"
else
    echo "❌ Success view missing"
fi

if grep -q "Welcome to CHEKKD" "$HTML_FILE"; then
    echo "✓ Success message"
else
    echo "❌ Success message missing"
fi

# Check for button attachment
echo ""
echo "Checking Button Integration..."
if grep -q "waitlistButtons" "$HTML_FILE" && grep -q "addEventListener" "$HTML_FILE"; then
    echo "✓ Auto-attach to waitlist buttons"
else
    echo "❌ Button auto-attachment missing"
fi

echo ""
echo "=========================================="
echo "Verification Complete!"
echo "=========================================="
echo ""
echo "Next Steps:"
echo "1. Run 'npm run dev' to start local server"
echo "2. Open browser to http://localhost:3000"
echo "3. Click any 'Join Waitlist' button to see modal"
echo "4. Test form validation:"
echo "   - Try submitting empty form"
echo "   - Enter invalid email"
echo "   - Enter short phone number"
echo "5. Test interactions:"
echo "   - Click outside modal to close"
echo "   - Press ESC key to close"
echo "   - Submit valid form to see success"
echo ""
