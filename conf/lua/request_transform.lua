ngx.req.read_body()
local body = ngx.req.get_body_data()
if body then
    local cjson = require "cjson.safe"
    local data = cjson.decode(body)
    if data then
        data["audit_info"] = {
            ip = ngx.var.remote_addr,
            user_agent = ngx.var.http_user_agent
        }
        local new_body = cjson.encode(data)
        ngx.req.set_body_data(new_body)
    end
end
