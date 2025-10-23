# syntax=docker/dockerfile:1
FROM nginx:alpine
RUN apk add --no-cache curl && mkdir -p /usr/share/nginx/html
COPY index.html /usr/share/nginx/html/index.html
RUN curl -fsSL https://cdn.jsdelivr.net/npm/jszip@3.10.1/dist/jszip.min.js \
    -o /usr/share/nginx/html/jszip.min.js
EXPOSE 80
