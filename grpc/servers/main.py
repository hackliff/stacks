#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""The Python implementation of the GRPC server."""

import time
from concurrent import futures

import grpc

import stdlib_pb2 as stdlib

_ONE_DAY_IN_SECONDS = 60 * 60 * 24


class StdLib(stdlib.StdLibServicer):

    def SimpleSync(self, request, context):
        print('Hey {}'.format(request.message))
        return stdlib.Bar(message='Hello', code=1)


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    stdlib.add_StdLibServicer_to_server(StdLib(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    print('listening on [::]:50051')
    try:
        while True:
            time.sleep(_ONE_DAY_IN_SECONDS)
    except KeyboardInterrupt:
        server.stop(0)

if __name__ == '__main__':
    serve()
