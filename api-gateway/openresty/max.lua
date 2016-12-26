local path = ngx.var.request:split(" ")[2] -- path
local t={}
local cjson = require "cjson"
ngx.log(0, path[2])
local m =  ngx.re.match(path,[=[^/v1/max/(.+).json]=])
local words = m[1]:split("+") -- words in the sentence

local max = nil
for i,k in pairs(words) do
   local res_word = ngx.location.capture("/v1/word/".. k .. ".json" )
   local value=cjson.new().decode(res_word.body)
   if max == nil or max.sentiment < value.sentiment  then
      max = value
   end
end
ngx.say(cjson.new().encode(max))