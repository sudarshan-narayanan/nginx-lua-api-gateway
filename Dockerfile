
FROM openresty/openresty:alpine

RUN apk add --no-cache luarocks curl redis && \
    luarocks install lua-resty-jwt && \
    luarocks install lua-cjson && \
    luarocks install prometheus

COPY . /usr/local/openresty/nginx/

WORKDIR /usr/local/openresty/nginx/

EXPOSE 8080 8081

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;", "-p", "/usr/local/openresty/nginx/", "-c", "nginx.conf"]
