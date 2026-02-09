#!/bin/bash
# Quick DNS verification script

echo "🔍 Checking DNS for chekkd.com..."
echo ""
echo "www.chekkd.com:"
dig www.chekkd.com +short
echo ""
echo "chekkd.com:"
dig chekkd.com +short
echo ""
echo "✅ If you see '76.76.21.21' above, DNS is correct!"
echo "❌ If you see '216.150.1.193', still pointing to GoDaddy"
echo ""
echo "Testing HTTP response..."
curl -sI https://www.chekkd.com/ | grep -E "HTTP|server" | head -2
echo ""
echo "✅ If you see 'HTTP/2 200' and 'server: Vercel', it's working!"
