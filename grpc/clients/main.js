const grpc = require('grpc')

const stdlib = {
  messages: require('../generated/stdlib_pb'),
  services: require('../generated/stdlib_grpc_pb')
}

const client = new stdlib.services.StdLibClient('localhost:50051', grpc.credentials.createInsecure())

const request = new stdlib.messages.Foo()
request.setMessage('hello')

client.simpleSync(request, (err, response) => {
  console.log('Got:', response.getMessage(), response.getCode())
})
