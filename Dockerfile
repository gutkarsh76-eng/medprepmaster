# Production Docker image for MedPrep Master Suite on Zeabur
FROM nginx:alpine

# Remove default nginx configs
RUN rm -rf /etc/nginx/conf.d/*

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy all portal assets into Nginx web root
COPY . /usr/share/nginx/html

# Ensure proper read permissions for Nginx on all files and PDFs
RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80
EXPOSE 8080
EXPOSE 3000

# Support dynamic $PORT environment variable if assigned by Zeabur
CMD ["sh", "-c", "if [ -n \"$PORT\" ]; then sed -i \"s/listen 80 default_server;/listen $PORT default_server;/g\" /etc/nginx/conf.d/default.conf; fi; nginx -g 'daemon off;'"]
