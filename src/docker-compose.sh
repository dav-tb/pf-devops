#!/bin/sh
set -e

# Default build configuration
BUILD_CONFIG="${1:-Release}"

# Resolve the publish directory from the .NET project
PUBLISH_DIR=$(dotnet msbuild DayWriter/DayWriter.csproj -getProperty:PublishDir -p:Configuration="$BUILD_CONFIG")

# Normalize path separators (MSBuild may return Windows-style backslashes)
PUBLISH_DIR=$(echo "$PUBLISH_DIR" | tr '\\' '/')

echo "Build configuration: $BUILD_CONFIG"
echo "Resolved PublishDir: $PUBLISH_DIR"

# Export as environment variable and run docker-compose
SOURCE_DIR="$PUBLISH_DIR" docker-compose up -d --build
