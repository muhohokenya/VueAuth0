#!/bin/sh

# Define the root directory where the files are located
ROOT_DIR=/usr/share/nginx/html/

# Echo the initial state of the config file
echo "Initial config.js content:"
cat $ROOT_DIR/config/config.js

# Replace env vars in JavaScript files
echo "Replacing env constants in JS"
for file in $ROOT_DIR/config/config.js
do
  echo "Processing $file ..."
 cat $file
  # Use sed to replace the version in the config file
  # This assumes the version value is formatted as version: "value"
  sed -i "s|version: \".*\"|version: \"$VUE_APP_VERSION\"|" $file
  echo "Updated $file to version $VUE_APP_VERSION:"
  cat $file  # Print the file content to verify the change
done

# Start Nginx

# Step 2: Reload Nginx to serve the new files
systemctl restart nginx
echo "Starting Nginx"
nginx -g 'daemon off;'