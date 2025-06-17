if ngx.req.get_method() == "OPTIONS" then
    ngx.header["Access-Control-Allow-Origin"] = "*"
    ngx.header["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS, PUT, DELETE"
    ngx.header["Access-Control-Allow-Headers"] = "Authorization, Content-Type"
    ngx.status = 204
    return ngx.exit(204)
end

ngx.header["Access-Control-Allow-Origin"] = "*"
