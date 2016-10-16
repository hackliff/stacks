package main

import (
	"log"
	"net"

	"github.com/hackliff/grpc/generated/stdlib"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

const (
	port = ":50051"
)

type server struct{}

// NOTE how to use ctx ?
func (s *server) SimpleSync(ctx context.Context, in *stdlib.Foo) (*stdlib.Bar, error) {
	log.Printf("processing new sync message: %v\n", in)
	// TODO try errors
	return &stdlib.Bar{Code: 0, Message: "accepted"}, nil
}

func main() {
	// NOTE what does grpc support as server ?
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	s := grpc.NewServer()
	stdlib.RegisterStdLibServer(s, &server{})

	log.Printf("listening on :%s", port)
	s.Serve(lis)
}
