const grpc = require('grpc')
// NOTE do that in ./generated ?
const stdlib = {
  messages: require('./../generated/stdlib_pb'),
  services: require('./../generated/stdlib_grpc_pb')
}

function simpleSync(call, callback) {
  const reply = new stdlib.messages.Bar()
  reply.setMessage('Hello ' + call.request.getMessage())
  reply.setCode(2)
  callback(null, reply)
}

var server = new grpc.Server()
server.addService(stdlib.services.StdLibService, { simpleSync })
server.bind('0.0.0.0:50051', grpc.ServerCredentials.createInsecure())
console.log('listening on 0.0.0.0:50051')
server.start()
