path "secret/preprod/*" {
  policy = "write"
}

path "secret/prod/*" {
  policy = "write"
}

path "secret/conf/*" {
  policy = "write"
}
