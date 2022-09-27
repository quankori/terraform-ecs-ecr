FROM golang:1.17

# golang specific variables
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

RUN mkdir -p /app

WORKDIR /app

COPY . ./

RUN ls -la

RUN go mod download

EXPOSE 8080

CMD ["go", "run", "main.go"]