# [Vault](https://www.vaultproject.io)


## Getting started

```Bash
$ # install it on Mac OSX
$ ./bootstrap.sh

$ vault server -dev
$ vault status
Sealed: false
Key Shares: 1
Key Threshold: 1
Unseal Progress: 0

High-Availability Enabled: false
$ curl "$VAULT_ADDR/v1/sys/health"
{"initialized":true,"sealed":false,"standby":false,"server_time_utc":1470148733}

$ write secret data ! `secret` prefix is mandatory
$ vault write secret/hello value=world
Success! Data written to: secret/hello
$ vault read secret/hello
Key                     Value
---                     -----
refresh_interval        2592000
value                   world
$ vault delete secret/hello
Success! Deleted 'secret/hello' if it existed.

```


## API Clients

- [Go](https://godoc.org/github.com/hashicorp/vault/api)
- [Node](https://github.com/kr1sp1n/node-vault)
- [Python](https://github.com/ianunruh/hvac)
