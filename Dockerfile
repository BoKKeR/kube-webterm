FROM golang:1.24-alpine

RUN apk add --no-cache git curl

# Install gotty
RUN go install github.com/sorenisanerd/gotty@latest

# Install k9s
RUN curl -Lo /usr/local/bin/k9s https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz && tar -xzf /usr/local/bin/k9s -C /usr/local/bin && chmod +x /usr/local/bin/k9s

EXPOSE 3000

ENTRYPOINT ["/bin/sh", "-c", "gotty -p 3000 k9s"]
