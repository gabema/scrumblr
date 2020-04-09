FROM nginx:alpine

LABEL maintainer="gabema@gmail.com"

VOLUME /var/cache/nginx

# Copy custom nginx config
COPY ./.docker/config/nginx.development.conf /etc/nginx/nginx.conf

# Copy staticly served files to nginx
COPY ./client /var/www/public

EXPOSE 80

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

# To build:
# docker build -t gabema/nginx -f .docker\nginx.dockerfile .
