# -*- coding: utf-8 -*-
# vim:fenc=utf-8

import logging

from scrapy import signals
from scrapy.exceptions import NotConfigured
from nats.aio.client import Client as Nats
from nats.aio.errors import ErrTimeout

logger = logging.getLogger(__name__)

import asyncio


def _io_exec(func):
    # loop_.run_until_complete(func(*args, **kwargs))
    asyncio.get_event_loop().run_until_complete(func)

class RemoteSpider(object):

    @classmethod
    def from_crawler(cls, crawler):
        ext = cls()

        # first check if the extension should be enabled and raise
        # NotConfigured otherwise
        if not crawler.settings.getbool('MARIONETTE_ENABLED'):
            raise NotConfigured

        cls._loop = asyncio.get_event_loop()
        cls._nc = Nats()
        _io_exec(cls._nc.connect(io_loop=cls._loop))

        # connect the extension object to signals
        crawler.signals.connect(ext.spider_opened, signal=signals.spider_opened)
        crawler.signals.connect(ext.spider_closed, signal=signals.spider_closed)

        return ext

    def spider_opened(self, spider):
        logger.info('************* opened spider %s', spider.name)
        _io_exec(self._nc.publish("log.info", b'opened spider'))

    def spider_closed(self, spider):
        logger.info('************* closed spider %s', spider.name)
        _io_exec(self._nc.publish("log.info", b'closed spider'))
        _io_exec(self._nc.close())
        self._loop.close()

