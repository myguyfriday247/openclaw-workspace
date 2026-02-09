#!/bin/bash
# Mission Control Server Script
# Run this to serve Mission Control at http://localhost:8080

cd /Users/myguyfriday/.openclaw/workspace

echo "🚀 Starting Mission Control server..."
echo "📍 Access at: http://localhost:8080/mission-control/"
echo ""
echo "Press Ctrl+C to stop the server"

python3 -m http.server 8080
