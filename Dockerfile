FROM openresty/openresty:alpine

RUN	apk --update add --no-cache --virtual .gettext gettext

ADD proxy.conf /etc/nginx/conf.d/proxy.tmpl

ENV LIMIT              0
ENV DELAY              0.0
ENV UPSTREAM           http://www.example.com
ENV BASE64_CREDENTIALS ''

CMD /bin/ash -c " \
        envsubst '\${LIMIT} \${UPSTREAM} \${DELAY} \${BASE64_CREDENTIALS}' \
                 < /etc/nginx/conf.d/proxy.tmpl > /etc/nginx/conf.d/default.conf \
        && nginx -g 'daemon off;'"
