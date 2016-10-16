#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""The Python implementation of the GRPC client."""

from __future__ import print_function

import grpc

import stdlib_pb2 as stdlib


def run():
    channel = grpc.insecure_channel('localhost:50051')
    stub = stdlib.StdLibStub(channel)
    response = stub.SimpleSync(stdlib.Foo(message='you'))
    print('StdLib client received: {} ({})'.format(response.message, response.code))


if __name__ == '__main__':
    run()
