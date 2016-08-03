#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""Experiment with Vault Python client."""

import os

import hvac

client = hvac.Client(url='http://localhost:8200', token=os.environ['VAULT_TOKEN'])
assert client.is_authenticated()

client.write('secret/foo', baz='bar', lease='1h')
print(client.read('secret/foo'))
client.delete('secret/foo')
