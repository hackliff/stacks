package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strings"
	"time"

	"github.com/nats-io/go-nats"
)

func repl(nc *nats.Conn) {
	reader := bufio.NewReader(os.Stdin)
	fmt.Println("Simple Scrapy Shell")
	fmt.Println("---------------------")

	for {
		fmt.Print("-> ")
		text, _ := reader.ReadString('\n')
		// convert CRLF to LF
		text = strings.Replace(text, "\n", "", -1)

		if strings.Compare(text, "quit") == 0 {
			fmt.Println("shutting down")
			break
		} else {
			// NOTE DSL like [cmd] [arguments,...] ?
			// Simple Publisher / Command center
			msg, _ := nc.Request("cmd.help", []byte(text), 10*time.Millisecond)
			fmt.Printf("go an answer: %s\n", msg.Data)
		}
	}
}

func main() {
	// NOTE try encoded connection ?
	nc, _ := nats.Connect(nats.DefaultURL)

	// Simple Async Subscriber / Smart logging
	nc.Subscribe("log.info", func(m *nats.Msg) {
		log.Printf("[ spider ] log.info - %s\n", string(m.Data))
	})

	// Replying / Remote configuration
	nc.Subscribe("conf.host", func(m *nats.Msg) {
		fmt.Printf("[ spider ] conf - %s\n", string(m.Data))
		nc.Publish(m.Reply, []byte("localhost"))
	})

	repl(nc)

	nc.Close()
}
