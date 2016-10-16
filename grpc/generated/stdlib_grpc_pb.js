// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('grpc');
var stdlib_pb = require('./stdlib_pb.js');

function serialize_stdlib_Bar(arg) {
  if (!(arg instanceof stdlib_pb.Bar)) {
    throw new Error('Expected argument of type stdlib.Bar');
  }
  return new Buffer(arg.serializeBinary());
}

function deserialize_stdlib_Bar(buffer_arg) {
  return stdlib_pb.Bar.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_stdlib_Foo(arg) {
  if (!(arg instanceof stdlib_pb.Foo)) {
    throw new Error('Expected argument of type stdlib.Foo');
  }
  return new Buffer(arg.serializeBinary());
}

function deserialize_stdlib_Foo(buffer_arg) {
  return stdlib_pb.Foo.deserializeBinary(new Uint8Array(buffer_arg));
}


var StdLibService = exports.StdLibService = {
  // NOTE is it possible to only pass int32 or none ?
  // normal synchronous function call
  simpleSync: {
    path: '/stdlib.StdLib/SimpleSync',
    requestStream: false,
    responseStream: false,
    requestType: stdlib_pb.Foo,
    responseType: stdlib_pb.Bar,
    requestSerialize: serialize_stdlib_Foo,
    requestDeserialize: deserialize_stdlib_Foo,
    responseSerialize: serialize_stdlib_Bar,
    responseDeserialize: deserialize_stdlib_Bar,
  },
};

exports.StdLibClient = grpc.makeGenericClientConstructor(StdLibService);
