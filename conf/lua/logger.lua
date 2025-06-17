local cjson = require "cjson.safe"

local log_data = {
    ip = ngx.var.remote_addr,
    uri = ngx.var.request_uri,
    method = ngx.req.get_method(),
    status = ngx.status,
    user_agent = ngx.var.http_user_agent,
    timestamp = ngx.time()
}

ngx.log(ngx.INFO, cjson.encode(log_data))
