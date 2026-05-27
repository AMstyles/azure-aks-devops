# Build Stage
FROM golang:1.21-alpine AS builder

WORKDIR /src

# Pre-copy dependency files if using modules (none for this dummy app, but good practice)
# COPY go.mod go.sum ./
# RUN go mod download

COPY main.go .

# Build statically linked binary
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o app main.go

# Production Stage
FROM alpine:3.18

RUN apk --no-cache add ca-certificates

# Create non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /home/appuser

COPY --from=builder /src/app .

RUN chown -R appuser:appgroup /home/appuser

USER appuser

ENV PORT=8080
EXPOSE 8080

CMD ["./app"]
