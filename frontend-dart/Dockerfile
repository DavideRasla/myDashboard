# Use Dart's official base image
FROM dart:stable

# Set working directory
WORKDIR /app

# Copy Dart source files
COPY . .

# Get dependencies
RUN dart pub get

# Build the Flutter web app
RUN dart pub global activate webdev && webdev build --output web:build

# Use a lightweight web server (like dhttpd) to serve the app
RUN dart pub global activate dhttpd

# Expose port 8082
EXPOSE 8082

# Serve the built app
CMD ["dhttpd", "--path", "build", "--port", "8082"]
