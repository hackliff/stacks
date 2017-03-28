# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""Temporary dumb spider."""

import scrapy

from .items import DumbItem


class BasicSpider(scrapy.Spider):
    name = 'Basic'

    def __init__(self, url, *args, **kwargs):
        super(BasicSpider, self).__init__(*args, **kwargs)
        self.start_urls = [url]

    def parse(self, response):
        yield DumbItem(title='whatever', url=response.url)
