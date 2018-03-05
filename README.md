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

 - `UPSTREAM`

   The location you like to proxy. This has to be a valid nginx
   [proxy_pass](http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass).

 - `DELAY`

   The number of seconds to delay the response. The given value will given to
   [ngx.sleep](https://github.com/openresty/lua-nginx-module#ngxsleep).
   Default is `0.0`.

 - `LIMIT`

   The limitation of the bandwidth in byes. The given value will be used as
   [limit_rate](http://nginx.org/en/docs/http/ngx_http_core_module.html#limit_rate).
   Using units is possible (`4k`, `2M`, ...). Default is `0` (no limit).

 - `BASE64_CREDENTIALS`

   Base64 encoded credentials passed to the upstream. Although its possible to
   pass credentials from the client through the proxy to the backend its
   sometimes convinient to hide the authorisation from the client. This value
   is passed as the basic authentication header to the backend (The part after
   `Basic`). Generate such a value via `echo -n 'user:pass' | base64`. Default
   is `''`
