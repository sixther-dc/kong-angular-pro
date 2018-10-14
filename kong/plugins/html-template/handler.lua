-- Extending the Base Plugin handler is optional, as there is no real
-- concept of interface in Lua, but the Base Plugin handler's methods
-- can be called from your child implementation and will print logs
-- in your `error.log` file (where all logs are printed).
local BasePlugin = require "kong.plugins.base_plugin"
local CustomHandler = BasePlugin:extend()
local template = require "resty.template"

CustomHandler.PRIORITY = 29
CustomHandler.VERSION = "0.1.0"

-- Your plugin handler's constructor. If you are extending the
-- Base Plugin handler, it's only role is to instanciate itself
-- with a name. The name is your plugin name as it will be printed in the logs.
function CustomHandler:new()
    CustomHandler.super.new(self, "html-template")
end

function CustomHandler:init_worker()
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    CustomHandler.super.init_worker(self)

    -- Implement any custom logic here
end

function CustomHandler:certificate(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    CustomHandler.super.certificate(self)

    -- Implement any custom logic here
end

function CustomHandler:rewrite(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    CustomHandler.super.rewrite(self)

    -- Implement any custom logic here
end

function CustomHandler:access(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    CustomHandler.super.access(self)
    -- Implement any custom logic here
end

function CustomHandler:header_filter(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    CustomHandler.super.header_filter(self)
    ngx.header.content_length = nil

    -- Implement any custom logic here
end

function CustomHandler:body_filter(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    CustomHandler.super.body_filter(self)


    --ngx.log(ngx.ERR, ngx.arg[2])
    --ngx.log(ngx.ERR, "=======================")
    --ngx.log(ngx.ERR, ngx.arg[1])


    local content_type = ngx.header.content_type
    -- 304的请求到了这里的content_type会是空的，需要兼容
    --[[
    ngx.log(ngx.ERR, ngx.header.content_length)
    if content_type ~= nil then
        if string.find(content_type, "html") ~= nil then
            html = template.compile(ngx.arg[1])({
                six = {
                    test = "安琪拉",
                    test1 = '扁鹊'
                }
            })
            ngx.arg[1] = html
        end
    end
    --]]
    -- Implement any custom logic here
end

function CustomHandler:log(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    CustomHandler.super.log(self)

    -- Implement any custom logic here
end

-- This module needs to return the created table, so that Kong
-- can execute those functions.
return CustomHandler
