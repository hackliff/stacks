package main

import (
	"fmt"
	"os"

	vault "github.com/hashicorp/vault/api"
)

func main() {
	// make sure VAULT_ADDR and VAULT_TOKEN is set
	config := vault.DefaultConfig()
	fmt.Printf("%v\n", config)

	client, err := vault.NewClient(config)
	if err != nil {
		fmt.Printf("err: %s", err)
		os.Exit(1)
	}
	println(client.Token())

	secret, err := client.Logical().List("secret/")
	if err != nil {
		fmt.Printf("err: %s", err)
		os.Exit(1)
	}
	fmt.Printf("secret: %v\n", secret)
}
