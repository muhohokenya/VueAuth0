FROM node:16-alpine as build

RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh

RUN mkdir /app

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Runtime stage
FROM nginx:alpine

# Install gettext package which provides envsubst
RUN apk add --no-cache gettext
# Configure Nginx
COPY --from=build /app/dist /usr/share/nginx/html
RUN mkdir -p /usr/share/nginx/html/config
COPY src/config/config.js /usr/share/nginx/html/config
COPY entrypoint.sh /entrypoint.sh
# Copy the JavaScript template file
COPY config.js.template /usr/share/nginx/html/

# Add a script to replace environment variables
COPY substitute_env.sh /usr/share/nginx/html/

# Grant execution permissions to the script
RUN chmod +x /usr/share/nginx/html/substitute_env.sh

ENV VUE_APP_VERSION = ""
ENV API_URL=""
ENV API_KEY=""
ENV APP_VERSION=""
# Expose port for Nginx
EXPOSE 80
RUN chmod +x /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]x


## Start Nginx
#CMD ["nginx", "-g", "daemon off;"]

# Use /bin/sh instead of /bin/bash
CMD ["/bin/sh", "-c", "/usr/share/nginx/html/substitute_env.sh && nginx -g 'daemon off;'"]