FROM golang:1.24-alpine

RUN apk add --no-cache git

RUN go install github.com/sorenisanerd/gotty@latest

EXPOSE 3000
ENTRYPOINT ["gotty -p 3000"]
