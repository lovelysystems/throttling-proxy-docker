# A Throttling Proxy

This is a simple delay and bandwith throttling proxy based on openresty
(nginx).


## Run

To run the proxy just start a container with the desired proxy options.

```bash
$ docker run -ti --rm -p 8080:8080 \
      -e UPSTREAM=https://my.fast-api.com/api \
      -e DELAY=5.0  \
      lovelysystems/throttle-proxy
```


## Configuration

All configuration is done by environment variables passed to the docker
container.

 - `UPSTREAM`

   The location you like to proxy. This has to be a valid nginx
   [proxy_pass](http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass)
   URL.

 - `DELAY`

   The number of seconds to delay the response. The given value will be passed to
   [ngx.sleep](https://github.com/openresty/lua-nginx-module#ngxsleep).
   Default is `0.0`.

 - `LIMIT`

   The limitation of the bandwidth in byes. The given value will be used as
   [limit_rate](http://nginx.org/en/docs/http/ngx_http_core_module.html#limit_rate).
   Using units is possible (`4k`, `2M`, ...). Default is `0` (no limit).

 - `RESOLVER`

   The resolver used for name resolution. The given value will be used as
   nginx [resolver](http://nginx.org/en/docs/http/ngx_http_core_module.html#resolver).
   Default value is 8.8.8.8 (google DNS)
