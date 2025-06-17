local dict = ngx.shared.rate_limit_store
local ip = ngx.var.remote_addr
local current = dict:get(ip)

if current and current > 100 then
    ngx.status = 429
    ngx.say("Rate limit exceeded")
    return ngx.exit(429)
else
    dict:incr(ip, 1, 0, 60)
end
