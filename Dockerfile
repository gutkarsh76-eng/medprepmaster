FROM nginx:alpine

RUN rm -rf /etc/nginx/conf.d/*

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html

RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
