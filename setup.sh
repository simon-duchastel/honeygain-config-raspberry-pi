
#!/bin/bash

# HoneyGain Configuration Script for Raspberry Pi
# This script sets up and runs the HoneyGain Docker container

set -e

# Load environment variables from honeygain.env file
if [ -f "honeygain.env" ]; then
    export $(grep -v '^#' honeygain.env | xargs)
    echo "Loaded configuration from honeygain.env"
else
    echo "Error: honeygain.env file not found"
    echo "Please create a honeygain.env file with your HoneyGain credentials"
    echo "You can use the provided template and fill in your actual values"
    exit 1
fi

# Check if required environment variables are set
if [ -z "$ACCOUNT_EMAIL" ]; then
    echo "Error: ACCOUNT_EMAIL not set in honeygain.env"
    exit 1
fi

if [ -z "$ACCOUNT_PASSWORD" ]; then
    echo "Error: ACCOUNT_PASSWORD not set in honeygain.env"
    exit 1
fi

if [ -z "$DEVICE_NAME" ]; then
    echo "Error: DEVICE_NAME not set in honeygain.env"
    exit 1
fi

echo "Starting HoneyGain container with device name: $DEVICE_NAME"
echo "Account: $ACCOUNT_EMAIL"

docker run -d honeygain/honeygain -tou-accept -email "$ACCOUNT_EMAIL" -pass "$ACCOUNT_PASSWORD" -device "$DEVICE_NAME"
