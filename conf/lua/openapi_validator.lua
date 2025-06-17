local cjson = require "cjson.safe"

ngx.req.read_body()
local body = ngx.req.get_body_data()

if ngx.var.request_uri == "/api/users" and ngx.req.get_method() == "POST" then
    local data = cjson.decode(body)
    if not data or not data.name or not data.email then
        ngx.status = 400
        ngx.say("OpenAPI validation failed: 'name' and 'email' are required.")
        return ngx.exit(400)
    end
end
