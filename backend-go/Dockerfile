# Build stage
FROM golang:1.20 as builder

# Set the working directory inside the container
WORKDIR /app

#we suppose 64bits arch
ENV GOARCH=amd64 
ENV GOOS=linux

# Copy the source code to the container
COPY . .

# Initialize Go module (if go.mod doesn't exist)
RUN if [ ! -f go.mod ]; then go mod init mymodule; fi

# Download dependencies (this will generate go.sum)
RUN go mod tidy

# Build the Go binary
RUN go build -o backend-go .

# Final stage
FROM alpine:latest

# Set the working directory for the final image
WORKDIR /root/

# Copy the binary from the builder image
COPY --from=builder /app/backend-go .

# Expose the application port (e.g., 8080)
EXPOSE 8080

RUN apk add --no-cache libc6-compat

# Command to run the Go binary
CMD ["./backend-go"]
