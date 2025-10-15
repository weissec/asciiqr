#!/bin/bash
# W3155 2025
# This script generates ASCII QR codes in normal and inverted colors.

# Check if qrencode is installed
if ! command -v qrencode &> /dev/null; then
  echo "Error: 'qrencode' is not installed."
  echo "Please install it using your package manager:"
  echo "  sudo apt install qrencode      # Debian/Ubuntu"
  echo "  sudo yum install qrencode      # RHEL/CentOS"
  echo "  brew install qrencode          # macOS (Homebrew)"
  exit 1
fi

# Check if a URL was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi

URL="$1"

# Generate UTF-8 QR code
qrs=$(qrencode -t UTF8 "$URL")

# Replace full block (black) with A
qr=$(echo "$qrs" | sed "s/$(echo -e '\xe2\x96\x88')/A/g")

# Replace space (white) with B
qr=$(echo "$qr" | sed "s/ /B/g")

# Swap A (black) to space (white)
qr=$(echo "$qr" | sed "s/A/ /g")

# Swap B (white) to full block (black)
qr=$(echo "$qr" | sed "s/B/$(echo -e '\xe2\x96\x88')/g")

# Handle upper half block
qr=$(echo "$qr" | sed "s/$(echo -e '\xe2\x96\x80')/A/g")

# Handle lower half block
qr=$(echo "$qr" | sed "s/$(echo -e '\xe2\x96\x84')/B/g")

# Swap upper to lower
qr=$(echo "$qr" | sed "s/A/$(echo -e '\xe2\x96\x84')/g")

# Swap lower to upper
qr=$(echo "$qr" | sed "s/B/$(echo -e '\xe2\x96\x80')/g")

# Output to HTML file
echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
<meta charset=\"UTF-8\">
<title>QR Code</title>
<style>
  body { background-color: #f9f9f9; font-family: monospace; }
</style>
</head>
<body>
<div style='width: 240px; margin: 0 auto; margin-top: 15%;'>
<span><b>Instructions:</b><br></br>View the source code for this page (CTRL + U) and copy anything within and including the &lt;pre&gt; and &lt;/pre&gt; tags. Paste directly into your HTML code.</span>
<pre style='background-color: white; color: black; padding: 1em; letter-spacing: -1px; line-height: 1em'>$qr</pre>
</div></body>
</html>" > qr_code.html
echo "[DONE] Generated QR code for: "$URL
echo
echo "1. ASCII QR (standard - for most scenarios):"
echo "$qr"
echo "2. ASCII QR (inverted - for specific scenarios):"
echo
echo "$qrs"
echo
echo "3. HTML QR code (saved to qr_code.html)"