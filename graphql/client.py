#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

import requests

HEADERS = {'Content-Type': 'application/json'}
QUERY = {'query': '{ hello }'}


res = requests.post('http://localhost:4000/graphql', headers=HEADERS, json=QUERY)

if res.status_code == 200:
    print(res.json())
