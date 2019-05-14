FROM nginx:latest
LABEL <maintainer>=Savio Mathew
EXPOSE 80 433
COPY index.html /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]