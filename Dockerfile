FROM golang

COPY . /go/src/github.com/jetstack/cert-manager
WORKDIR /go/src/github.com/jetstack/cert-manager

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
		-a -tags netgo \
		-o /usr/bin/cert-manager \
		./cmd/controller

ENTRYPOINT ["/usr/bin/cert-manager"]
