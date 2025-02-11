.PHONY: all clean

all: go-hello

clean:
	rm -rf go-hello

go-hello: go-hello.go
	GOOS="linux" GOARCH="arm64" go build go-hello.go
