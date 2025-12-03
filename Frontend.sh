#!/bin/bash
# Cross-distro attempt to install nginx and serve a simple page
if command -v apt-get >/dev/null 2>&1; then
  apt-get update -y
  apt-get install -y nginx
  systemctl enable nginx
  cat > /var/www/html/index.html <<'EOF'
<html><body><h1>Hello from frontend ASG (single AZ)</h1></body></html>
EOF
  systemctl restart nginx
else
  yum install -y nginx
  systemctl enable nginx
  cat > /usr/share/nginx/html/index.html <<'EOF'
<html><body><h1>Hello from frontend ASG (single AZ)</h1></body></html>
EOF
  systemctl restart nginx
fi
