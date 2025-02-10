.PHONY: all clean

all: go-hello

clean:
	rm -rf go-hello

go-hello: go-hello.go
	go build go-hello.go

