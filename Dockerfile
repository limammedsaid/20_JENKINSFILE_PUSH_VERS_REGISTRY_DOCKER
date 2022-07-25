FROM nginx:latest
RUN sed -i 's/nginx/said/g' /usr/share/nginx/html/index.html
EXPOSE 80

