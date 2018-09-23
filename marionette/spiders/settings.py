# -*- coding: utf-8 -*-
# vim:fenc=utf-8

BOT_NAME = 'marionette'

SPIDER_MODULES = [
    'spiders'
]
NEW_SPIDER_MODULE = 'spiders'

# Crawl responsibly by identifying yourself (and your website) on the user-agent
USER_AGENT = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36'

EXTENSIONS = {
    'spiders.extensions.marionette.RemoteSpider': 100
}

LOG_LEVEL = 'WARNING'

MARIONETTE_ENABLED = True

try:
    from local_settings import *
except ImportError:
    pass
