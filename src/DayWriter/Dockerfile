# Runtime-only image
# Expects pre-built artifacts from CI pipeline in ./publish directory
FROM mcr.microsoft.com/dotnet/runtime:8.0

WORKDIR /app

# Build argument for source directory
ARG SOURCE_DIR=publish

# Create non-root user for security
RUN groupadd --gid 1000 daywriter \
    && useradd --uid 1000 --gid 1000 --shell /bin/false --no-create-home daywriter

# Copy pre-built application from CI pipeline
COPY ${SOURCE_DIR}/ .

# Set ownership to the non-root user
RUN chown -R daywriter:daywriter /app

# Switch to non-root user
USER daywriter

# Run the application
ENTRYPOINT ["dotnet", "DayWriter.dll"]
