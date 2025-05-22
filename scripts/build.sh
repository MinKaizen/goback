#!/bin/bash

set -e  # exit on any error

OUTPUT_DIR="bin"
ENTRY_POINT="./cmd/backtester"
APP_NAME="backtester"

# Define target platforms: OS and ARCH
PLATFORMS=(
  "linux amd64"
  "linux arm64"
  "windows amd64"
  "windows 386"
  "windows arm64"
  "darwin amd64"
  "darwin arm64"
)

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each target platform
for platform in "${PLATFORMS[@]}"; do
  read -r GOOS GOARCH <<< "$platform"
  output_name="${APP_NAME}-${GOOS}-${GOARCH}"

  # Add .exe for Windows builds
  [ "$GOOS" = "windows" ] && output_name+=".exe"

  echo "Building $output_name..."
  GOOS=$GOOS GOARCH=$GOARCH go build -o "${OUTPUT_DIR}/${output_name}" "$ENTRY_POINT"
done

echo "✅ All builds complete. Binaries are in ./${OUTPUT_DIR}"

