local prometheus = require("prometheus").init("prometheus_metrics")

local requests = prometheus:counter(
    "nginx_http_requests_total", "Number of HTTP requests", {"method", "path"}
)
local latency = prometheus:histogram(
    "nginx_http_request_duration_seconds", "HTTP request latency", {"method", "path"}
)

local method = ngx.req.get_method()
local path = ngx.var.uri

requests:inc(1, {method, path})
latency:observe(ngx.now() - ngx.req.start_time(), {method, path})
