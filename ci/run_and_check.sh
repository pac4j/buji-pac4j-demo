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
    echo "✅ Application responds with HTTP 200"
    echo "🌐 Application accessible at: http://localhost:8080"
    
    # Test clicking on casLink and following redirections to CAS login page
    echo "🔗 Testing casLink redirection to CAS login page..."
    
    # Get the casLink URL from the homepage
    CASLINK_URL="http://localhost:8080/cas/index.jsp"
    echo "📍 Following casLink: $CASLINK_URL"
    
    # Follow redirections and capture final URL and response
    CAS_RESPONSE=$(curl -s -L -w "FINAL_URL:%{url_effective}\nHTTP_CODE:%{http_code}" "$CASLINK_URL")
    CAS_HTTP_CODE=$(echo "$CAS_RESPONSE" | grep "HTTP_CODE:" | cut -d: -f2)
    CAS_FINAL_URL=$(echo "$CAS_RESPONSE" | grep "FINAL_URL:" | cut -d: -f2-)
    CAS_CONTENT=$(echo "$CAS_RESPONSE" | sed '/^FINAL_URL:/d' | sed '/^HTTP_CODE:/d')
    
    echo "🌐 Final URL: $CAS_FINAL_URL"
    echo "📄 HTTP Code: $CAS_HTTP_CODE"
    
    # Verify we reached the CAS login page
    if [ "$CAS_HTTP_CODE" = "200" ] && echo "$CAS_CONTENT" | grep -q "Enter Username & Password"; then
        echo "✅ CAS login page test passed!"
        echo "🔐 Successfully redirected to CAS login page"
        echo "📋 Page contains login form with username/password fields"
        CAS_TEST_PASSED=true
    else
        echo "❌ CAS login page test failed!"
        echo "🚫 Expected CAS login page but got:"
        echo "   HTTP Code: $CAS_HTTP_CODE"
        echo "   Final URL: $CAS_FINAL_URL"
        if [ ${#CAS_CONTENT} -lt 500 ]; then
            echo "   Content preview: $CAS_CONTENT"
        else
            echo "   Content preview: $(echo "$CAS_CONTENT" | head -c 500)..."
        fi
        CAS_TEST_PASSED=false
    fi
else
    echo "❌ Initial test failed! HTTP code received: $HTTP_CODE"
    echo "📋 Server logs:"
    cat target/jetty.log
    CAS_TEST_PASSED=false
fi

# Always stop the server
echo "🛑 Stopping server..."
kill $JETTY_PID 2>/dev/null || true

# Wait a moment for graceful shutdown
sleep 2

# Force kill if still running
kill -9 $JETTY_PID 2>/dev/null || true

if [ "$HTTP_CODE" = "200" ] && [ "$CAS_TEST_PASSED" = "true" ]; then
    echo "🎉 buji-pac4j-demo test completed successfully!"
    echo "✅ All tests passed:"
    echo "   - Application responds with HTTP 200"
    echo "   - CAS link redirects correctly to login page"
    exit 0
else
    echo "💥 buji-pac4j-demo test failed!"
    if [ "$HTTP_CODE" != "200" ]; then
        echo "❌ Application HTTP test failed (code: $HTTP_CODE)"
    fi
    if [ "$CAS_TEST_PASSED" != "true" ]; then
        echo "❌ CAS redirection test failed"
    fi
    exit 1
fi
