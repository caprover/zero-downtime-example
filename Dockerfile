# Use the official NGINX image as the base image
FROM nginx:latest

EXPOSE 80
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# invalidating the docker cache
ADD https://www.google.com /time.now

RUN echo "Build unique identifier: $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)" > /usr/share/nginx/html/index.html

HEALTHCHECK --interval=3s --timeout=1s --retries=15 \
  CMD curl -f http://127.0.0.1:80/ || exit 1


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
