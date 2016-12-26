-- https://github.com/openresty/lua-resty-redis

local redis = require "resty.redis"
local red = redis:new()

-- try docker namespace
local ok, err = red:connect("redis", 6379)
if not ok then
  ngx.say("failed to connect: ", err)
  return
end

local res, err = red:get("content")
if res == ngx.null then
  ngx.say("content not found")
  ok, err = red:set("content", "some cached data")
  return
end

ngx.say("content: ", res)
