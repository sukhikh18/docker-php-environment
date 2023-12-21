FROM nginx:1

RUN rm -f /etc/nginx/conf.d/default.conf

ADD ./nginx.conf /etc/nginx/
ADD conf.d/*.conf /etc/nginx/conf.d/
ADD conf.d/global/*.conf /etc/nginx/conf.d/global/

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
