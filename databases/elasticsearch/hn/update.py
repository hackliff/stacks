#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

try:
    from urllib.parse import urlparse
except:
    from urlparse import urlparse

import requests

HN_API_BASE = 'https://hacker-news.firebaseio.com'
HN_API_VERSION = 'v0'
DL_HEADERS = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36'
}


def normalize_story(item):
    item.pop('kids', None)

    if item['type'] != 'story':
        print('skiped item %s' % item['id'])
        return None

    if not 'url' in item or not item['url']:
        item['url'] = 'http://news.ycombinator.com/item?id=%s' % item['id']
        item['domain'] = 'news.ycombinator.com'
    else:
        u = urlparse(item['url'])
        item['domain'] = u.hostname.replace('www.', '') if u.hostname else ''

    # ES uses milliseconds
    item['time'] = int(item['time']) * 1000

    return item


def _hn_url(resource):
    return '%s/%s/%s' % (HN_API_BASE, HN_API_VERSION, resource)


def download_story(story_id):
    url = _hn_url('item/%s.json' % story_id)
    res = requests.get(url, headers=DL_HEADERS)

    return normalize_story(res.json())


def download_topstories():
    res = requests.get(_hn_url('topstories.json'))

    return [story for story in map(download_story, res.json()) if story is not None]


def index_story(item):
    print('indexing item (%s/%s)' % (item['type'], item['id']))
    es_url = 'http://localhost:9200/hn/%s/%s' % (item['type'], item['id'])
    res = requests.put(es_url, json=item)
    return res.text


if __name__ == '__main__':
    for story in download_topstories():
        print(index_story(story))
