#!/bin/bash

# Script to launch buji-pac4j-demo and verify it works
# Usage: ./run_and_check.sh

set -e  # Stop script on error

echo "🚀 Starting buji-pac4j-demo..."

# Go to project directory (one level up from ci/)
cd ..

# Clean and compile project
echo "📦 Compiling project..."
mvn clean package -q

# Ensure target directory exists
mkdir -p target

# Start Jetty in background
echo "🌐 Starting Jetty server..."
mvn jetty:run > target/jetty.log 2>&1 &
JETTY_PID=$!

# Wait for server to start (maximum 60 seconds)
echo "⏳ Waiting for server startup..."
for i in {1..60}; do
    if curl -s -o /dev/null -w "%{http_code}" http://localhost:8080 | grep -q "200"; then
        echo "✅ Server started successfully!"
        break
    fi
    if [ $i -eq 60 ]; then
        echo "❌ Timeout: Server did not start within 60 seconds"
        echo "📋 Server logs:"
        cat target/jetty.log
        kill $JETTY_PID 2>/dev/null || true
        exit 1
    fi
    sleep 1
done

# Verify application responds correctly
echo "🔍 Verifying HTTP response..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080)

if [ "$HTTP_CODE" = "200" ]; then
    echo "✅ Test passed! Application responds with HTTP 200"
    echo "🌐 Application accessible at: http://localhost:8080"
else
    echo "❌ Test failed! HTTP code received: $HTTP_CODE"
    echo "📋 Server logs:"
    cat target/jetty.log
fi

# Always stop the server
echo "🛑 Stopping server..."
kill $JETTY_PID 2>/dev/null || true

# Wait a moment for graceful shutdown
sleep 2

# Force kill if still running
kill -9 $JETTY_PID 2>/dev/null || true

if [ "$HTTP_CODE" = "200" ]; then
    echo "🎉 buji-pac4j-demo test completed successfully!"
    exit 0
else
    echo "💥 buji-pac4j-demo test failed!"
    exit 1
fi
