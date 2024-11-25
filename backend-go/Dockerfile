# Use Go as base image
FROM golang:1.20-alpine

# Set working directory
WORKDIR /app

# Copy Go source files
COPY . .

# Build the application
RUN go build -o app main.go

# Expose port 8081
EXPOSE 8081

# Run the application
ENTRYPOINT ["./app"]
