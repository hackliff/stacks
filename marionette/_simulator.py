#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""Scrapy emulator."""


import asyncio

from nats.aio.client import Client as Nats
from nats.aio.errors import ErrTimeout


def run(loop):
    nc = Nats()
    yield from nc.connect(io_loop=loop)

    # Send a request and expect a single response and trigger timeout if not
    # faster than 50 ms.
    try:
        response = yield from nc.timed_request("conf.host", b'host', 0.050)
        print("Received response: {message}".format(message=response.data.decode()))
    except ErrTimeout:
        print("Request timed out")

    yield from nc.publish("log.info", b'initializing')
    yield from nc.publish("log.info", b'scraping item 1')

    @asyncio.coroutine
    def help_request(msg):
        subject = msg.subject
        reply = msg.reply
        data = msg.data.decode()
        print("Received a message on '{subject} {reply}': {data}".format(
            subject=subject, reply=reply, data=data
)       )
        yield from nc.publish(reply, b'I can help')

    # Use queue named 'workers' for distributing requests among subscribers.
    yield from nc.subscribe("cmd.help", "workers", help_request)

    yield from asyncio.sleep(20, loop=loop)
    yield from nc.close()


if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    loop.run_until_complete(run(loop))
    loop.close()
