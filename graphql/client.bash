#! /usr/bin/env bash
#
# Copyright (C) 2016 hackliff <xavier.bruhiere@gmail.com>

curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"query": "{ hello  }"}' \
  http://localhost:4000/graphql

