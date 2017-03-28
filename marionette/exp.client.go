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

/* Client skills
 * - remote and interactive configuration
 * - pretty printing of steps/logs
 * - spider slow motion, step by step debugging
 */

func repl(spider *Spider) {
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
			msg, _ := spider.Exec("cmd.help", text, 10)
			fmt.Printf("go an answer: %s\n", msg.Data)
		}
	}
}

// Spider is a remote abstraction of remote python implementation
type Spider struct {
	nc string
}

// TODO use proper discovery and settigns
func NewSpider(url string) *Spider {
	// NOTE no error ?
	nc := nats.Connect(nats.DefaultURL)

	// Simple Async Subscriber / Smart logging
	// TODO how to handle subscription levels ?
	nc.Subscribe("log.info", func(m *nats.Msg) {
		log.Printf("[ spider ] log.info - %s\n", string(m.Data))
	})

	return &Spider{
		nc,
	}
}

// TODO support other than string
func (s *Spider) Configure(key, value string) {
	// NOTE should we read nats.Msg instead ?
	channel = fmt.Sprintf("conf.%s", key)

	// Replying / Remote configuration
	s.nc.Subscribe(channel, func(m *nats.Msg) {
		log.Printf("[ spider ] conf.%s=%s (spider: %s)\n", key, value, string(m.Data))
		nc.Publish(m.Reply, []byte(value))
	})
}

func (s *Spider) Exec(command string, arg string, timeout int) (string, error) {
	return s.nc.Request(command, byte(arg), timeout*time.Millisecond)
}

func main() {
	// NOTE try encoded connection ?
	spider := NewSpider(nats.Connect(nats.DefaultURL))

	spider.Configure("host", "0.0.0.0")

	repl(spider)

	spider.nc.Close()
}
