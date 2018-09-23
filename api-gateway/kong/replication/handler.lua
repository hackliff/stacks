-- doc: https://getkong.org/docs/0.9.x/plugin-development/custom-logic/

-- Extending the Base Plugin handler is optional, as there is no real
-- concept of interface in Lua, but the Base Plugin handler's methods
-- can be called from your child implementation and will print logs
-- in your `error.log` file (where all logs are printed).
local BasePlugin = require "kong.plugins.base_plugin"
local CustomHandler = BasePlugin:extend()

-- high priority given we want raw replication
CustomHandler.PRIORITY = 10

-- Your plugin handler's constructor. If you are extending the
-- Base Plugin handler, it's only role is to instanciate itself
-- with a name. The name is your plugin name as it will be printed in the logs.
function CustomHandler:new()
  CustomHandler.super.new(self, "replicate-plugin")
end

function CustomHandler:access(config)
  CustomHandler.super.access(self)

  ngx.log(ngx.ERR, "replicating traffic")
  print(config.target)
  print(config.telemetry)
end

-- This module needs to return the created table, so that Kong
-- can execute those functions.
return CustomHandler
