
local redis = require "resty.redis"
local red = redis:new()

red:set_timeout(1000)
local ok, err = red:connect("127.0.0.1", 6379)
if not ok then
    ngx.status = 500
    ngx.say("Redis connection failed")
    return ngx.exit(500)
end

local ip = ngx.var.remote_addr
local key = "rl:" .. ip
local current, err = red:get(key)

if current == ngx.null then
    red:setex(key, 60, 1)
elseif tonumber(current) >= 100 then
    ngx.status = 429
    ngx.say("Rate limit exceeded (Redis)")
    return ngx.exit(429)
else
    red:incr(key)
end
