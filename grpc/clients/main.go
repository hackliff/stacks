package main

import (
	"log"

	"github.com/hackliff/grpc/generated/stdlib"

	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

const (
	address = "localhost:50051"
)

func main() {
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}
	defer conn.Close()
	client := stdlib.NewStdLibClient(conn)

	r, err := client.SimpleSync(context.Background(), &stdlib.Foo{Message: "hello"})
	if err != nil {
		log.Fatalf("could not simplesync: %v", err)
	}
	log.Printf("SimpleSync: %s (%d)", r.Message, r.Code)
}
