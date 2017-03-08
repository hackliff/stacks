#! /usr/bin/env bash

function check_es() {
  echo "ES cluster $(curl --silent localhost:9200 | jq '.name') is ready"
}

# ex: hn_details 8605204
function hn_details() {
  local item_id="$1"
  local opts="print=pretty"

  curl --silent "https://hacker-news.firebaseio.com/v0/item/${item_id}.json?${opts}" | jq '.'
}

function store_es() {
  local item_id="$1"
  local content_path="$2"

  curl -XPUT "http://localhost:9200/hn/story/${item_id}" -d @${content_path}
}
