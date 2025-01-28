FROM golang:1.21 as builder

WORKDIR /app

# Copy go.mod and go.sum first to leverage Docker cache
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o server

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/server .

EXPOSE 8081

CMD ["./server"]


