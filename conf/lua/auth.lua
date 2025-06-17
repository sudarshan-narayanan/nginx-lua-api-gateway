local jwt = require "resty.jwt"
local cjson = require "cjson"

local token = ngx.req.get_headers()["Authorization"]

if not token or token == "" then
    ngx.status = 401
    ngx.say("Missing token")
    return ngx.exit(401)
end

token = string.gsub(token, "Bearer ", "")
local jwt_obj = jwt:verify("your-secret", token)

if not jwt_obj.verified then
    ngx.status = 401
    ngx.say("Invalid token")
    return ngx.exit(401)
end
