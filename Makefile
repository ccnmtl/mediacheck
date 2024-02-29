ROOT_DIR:=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

mediacheck: *.go
	CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' .

build:
	docker run --rm -v $(ROOT_DIR):/src -v /var/run/docker.sock:/var/run/docker.sock centurylink/golang-builder thraxil/mediacheck

push: build
	docker push thraxil/mediacheck
