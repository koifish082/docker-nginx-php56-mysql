FROM nginx:stable

# Copy Nginx conf
COPY conf/conf.d/default /etc/nginx/conf.d/default.conf

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
