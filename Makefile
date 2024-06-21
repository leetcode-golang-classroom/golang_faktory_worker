.PHONY=build

build-producer:
	@CGO_ENABLED=0 GOOS=linux go build -o bin/producer producer/main.go

build-worker:
	@CGO_ENABLED=0 GOOS=linux go build -o bin/worker worker/main.go

run-producer: build-producer
	@FAKTORY_URL=tcp://:some_password@localhost:7419 FAKTORY_PROVIDER=FAKTORY_URL ./bin/producer

run-worker: build-worker
	@FAKTORY_URL=tcp://:some_password@localhost:7419 FAKTORY_PROVIDER=FAKTORY_URL ./bin/worker

test:
	@go test -v ./...
