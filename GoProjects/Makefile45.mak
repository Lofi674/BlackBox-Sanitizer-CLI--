.PHONY: build test bench install clean

APP_NAME=blackbox
VERSION=1.0.0

build:
	go build -ldflags="-s -w -X main.Version=$(VERSION)" -o bin/$(APP_NAME) cmd/blackbox/main.go

build-all:
	GOOS=linux GOARCH=amd64 go build -o bin/$(APP_NAME)-linux-amd64 cmd/blackbox/main.go
	GOOS=darwin GOARCH=amd64 go build -o bin/$(APP_NAME)-darwin-amd64 cmd/blackbox/main.go
	GOOS=darwin GOARCH=arm64 go build -o bin/$(APP_NAME)-darwin-arm64 cmd/blackbox/main.go
	GOOS=windows GOARCH=amd64 go build -o bin/$(APP_NAME)-windows-amd64.exe cmd/blackbox/main.go

test:
	go test -v ./...

bench:
	go test -bench=. -benchmem ./test/

install:
	go install cmd/blackbox/main.go

clean:
	rm -rf bin/

lint:
	golangci-lint run

release: build-all
	tar -czf bin/$(APP_NAME)-$(VERSION)-linux-amd64.tar.gz -C bin $(APP_NAME)-linux-amd64
	tar -czf bin/$(APP_NAME)-$(VERSION)-darwin-amd64.tar.gz -C bin $(APP_NAME)-darwin-amd64
	tar -czf bin/$(APP_NAME)-$(VERSION)-darwin-arm64.tar.gz -C bin $(APP_NAME)-darwin-arm64
	zip bin/$(APP_NAME)-$(VERSION)-windows-amd64.zip bin/$(APP_NAME)-windows-amd64.exe