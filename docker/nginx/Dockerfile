FROM nginx:1.10

ADD nginx.conf /etc/nginx/

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
