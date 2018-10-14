return {
    fields = {
        method = { default = "POST", enum = { "POST", "PUT", "PATCH" } },
        content_type = { default = "application/json", enum = { "application/json" } },
        timeout = { default = 10000, type = "number" },
        keepalive = { default = 60000, type = "number" },
        met = { default = "POST", enum = { "POST", "PUT", "PATCH" }, type = "array" },

    }
}
