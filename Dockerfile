FROM nginx:1.19-alpine
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY /public /usr/share/nginx/html
