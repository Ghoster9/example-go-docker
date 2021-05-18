FROM golang:1.16.4

COPY main.go /app/main.go

CMD ["go", "run", "/app/main.go"]
