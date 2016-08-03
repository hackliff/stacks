const opts = {
  apiVersion: 'v1',
  endpoint: 'http://127.0.0.1:8200',
  token: '4a13d33a-fa5a-6b64-ef32-a7185b9add45',
}

const vault = require('node-vault')(opts)

vault.status()
  .then(console.log)
  .catch(console.error)

vault.write('secret/hello', { value: 'world', lease: '1s'  })
  .then(() => vault.read('secret/hello'))
  .then(console.log)
  .then(() => vault.delete('secret/hello'))
  .catch(console.error);

