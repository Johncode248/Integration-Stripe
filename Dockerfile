FROM golang:1.21 AS builder

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./...

FROM composer:latest AS production
COPY --from=builder /app .
CMD [ "/app/main" ]