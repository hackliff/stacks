local options = {
  method = ngx.HTTP_GET,
  args = { maxsize = 5000  }
}

local res = ngx.location.capture("/nickname", options)
--ngx.say("<p>hello, gentleman</p>");
ngx.say(cjson.encode({status=res.status, content=res.body}));
