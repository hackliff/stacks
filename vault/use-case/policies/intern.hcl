path "secret/preprod/*" {
  capabilities = ["read"]
}

path "secret/conf/*" {
  capabilities = ["create"]
}
