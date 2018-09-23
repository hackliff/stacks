# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""Scrapers data models."""

import scrapy


class DumbItem(scrapy.Item):
    title = scrapy.Field()
    url = scrapy.Field()
