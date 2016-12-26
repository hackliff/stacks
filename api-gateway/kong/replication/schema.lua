-- doc: https://getkong.org/docs/0.9.x/plugin-development/plugin-configuration/

return {
  no_consumer = true, -- this plugin will only be API-wide,

  fields = {
    target = { type = "string", required = true },
    telemetry = { type = "boolean", default = false }
  },

  self_check = function(schema, plugin_t, dao, is_updating)
    -- perform any custom verification
    return true
  end
}
