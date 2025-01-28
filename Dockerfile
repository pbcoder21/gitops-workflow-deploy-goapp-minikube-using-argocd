# Use a lightweight base image
FROM golang:1.21 as builder

# Set the GOPATH
ENV GOPATH=/go

# Disable Go modules
ENV GO111MODULE=off

# Set the working directory to GOPATH/src
WORKDIR /go/src/app

# Copy your Go source code to the container
COPY . .

# Build your Go application
RUN CGO_ENABLED=0 GOOS=linux go build -o server

# Use a minimal base image for the final image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /go/src/app/server .

# Expose the port your application will run on
EXPOSE 8081

# Start your Go application
CMD ["./server"]

