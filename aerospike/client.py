#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

"""Aerospike client testing for fun and profit."""

import aerospike

# Configure the client
config = {
  'hosts': [ ('127.0.0.1', 3000) ],
  'policies': {
      'timeout': 1000  # ms
    }
}

# Create a client and connect it to the cluster
try:
  conn = aerospike.client(config).connect()
except:
  import sys
  print("failed to connect to the cluster with", config['hosts'])
  sys.exit(1)

# Records are addressable via a tuple of (namespace, set, key)
key = ('test', 'demo', 'foo')

try:
  # Write a record
  record = {
    'name': 'John Doe',
    'age': 32
  }
  conn.put(key, record, {'ttl': 120}
except Exception as e:
  import sys
  print("error: {0}".format(e), file=sys.stderr)

# Read a record
(key, metadata, record) = conn.get(key)
print('modifications {gen} times, ttl: {ttl}'.format(**metadata))
print('got record: {}'.format(record))

# Close the connection to the Aerospike cluster
conn.close()
