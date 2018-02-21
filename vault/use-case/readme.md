# Use Case

## Description

An administrator deploys and initializes a single Vault instance, backed
by Consul for persistence and loaded with
[Github](https://www.vaultproject.io/docs/auth/github.html) auth backend
and [AWS](https://www.vaultproject.io/docs/secrets/aws/) secret
backends.

Interns will use a specific token for authentification, so we can simply
revoke it when they leave. Team members will use their Github access
token, for convenience.

The team lead is given two of the three necessary unsealed keys for root
access, and the token for root access and administration.

Team members are given full deploy capabilities and casual
configurations.

Interns are given pre-production read-only access and casual
configurations read-writes.

Parameters are set from a configuration file, a server in `node.js`
read `postgres` credentials from Vault and a `Go` program automates
deployments.


## Guide

### Initialize the Vault

```Bash
$ honcho start
[ ... ]

$ vault operator init
Unseal Key 1:
540541ef32414ac80ba95f0be0c653749b49c887cbe3b51ccc7e404e1b72165c01
Unseal Key 2:
dc371c439c8439a456276d5ad163ddad46bb35f38fc7a493c9a79c980a3fd78f02
Unseal Key 3:
a7e0ab35a317f793c6885671e05036217fb82acf10e8951b02dd94379759317303
Unseal Key 4:
c65873eea5c90d9defcf9164422fe4111f4255eb2c95d7aa971ec6e307f353e304
Unseal Key 5:
bd8fc4989a5ac3aa7f60aa4f731c0f9d26414ad7b3bae6225c64ce4c9a95b51f05
Initial Root Token: 02c37ff2-38f9-2319-cfbb-a3645bbb3f04

Vault initialized with 5 keys and a key threshold of 3. Please
securely distribute the above keys. When the Vault is re-sealed,
restarted, or stopped, you must provide at least 3 of these keys
to unseal it again.

Vault does not store the master key. Without at least 3 keys,
your Vault will remain permanently sealed.

$ # unseal vault pasting 3 keys
$ vault unseal
Key (will be hidden):
Sealed: true
Key Shares: 5
Key Threshold: 3
Unseal Progress: 1
$ # ...

$ # authentify as root
$ vault auth 02c37ff2-38f9-2319-cfbb-a3645bbb3f04
Successfully authenticated! You are now logged in.
token: 02c37ff2-38f9-2319-cfbb-a3645bbb3f04
token_duration: 0
token_policies: [root]
```

### Configure the server


```Bash
$ # mount backends
$ vault auth enable -path=github github
Successfully enabled 'github' at 'github'!
$ # only accept users from the appturbo organization
$ vault write auth/github/config organization=appturbo
Success! Data written to: auth/github/config
$ # and automatically give them the `team` cal policy
$ vault write auth/github/map/teams/default value=team

$ # write servers configuration
$ vault write secret/prod/hank @confs/prod.json
Success! Data written to: secret/prod/hank
$ vault write secret/preprod/hank @confs/preprod.json
Success! Data written to: secret/preprod/hank
$ vault write secret/conf/hank @confs/conf.json
Success! Data written to: secret/conf/hank

$ # register policies
$ vault policy-write intern ./policies/intern.hcl
Policy 'intern' written.
$ vault policy-write team ./policies/team.hcl
Policy 'team' written.
```


### Manage users

```Bash
$ # create token for interns
$ vault token create -policy="intern"
Key             Value
---             -----
token           5e53f27a-59f3-f586-15aa-e18060ecfa49
token_accessor  ab58589c-8df2-aa4c-9188-aebc81f58584
token_duration  2592000
token_renewable true
token_policies  [default intern]

$ # check an intern can't read on production and can't write on preproduction
$ vault auth 5e53f27a-59f3-f586-15aa-e18060ecfa49
Successfully authenticated! You are now logged in.
token: 5e53f27a-59f3-f586-15aa-e18060ecfa49
token_duration: 2591867
token_policies: [default, intern]

$ vault read 
Error reading secret/prod: Error making API request.

URL: GET http://127.0.0.1:8200/v1/secret/prod/hank
Code: 400. Errors:

* permission denied

$ vault read secret/preprod/hank
Key                     Value
---                     -----
refresh_interval        2592000
host                    hank-pre.us-east-1.elasticbeanstalk.com

$ # team members already have access according to the team policy
$ vault auth -method=github token=$GITHUB_TOKEN
Successfully authenticated! You are now logged in.
The token below is already saved in the session. You do not
need to "vault auth" again with the token.
token: c30f6989-0ab1-23e2-9ef5-95403e648b4b
token_duration: 2592000
token_policies: [default, team]

$ vault write secret/prod/hank
host=hank.appturbo.net
Success! Data written to: secret/prod/hank
```
