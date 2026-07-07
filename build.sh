#!/bin/bash
echo "Downloading Flutter..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# Disable analytics to prevent interactive prompts that hang the build
flutter config --no-analytics

echo "Running flutter pub get..."
flutter pub get

echo "Building Flutter Web..."
flutter build web --release
