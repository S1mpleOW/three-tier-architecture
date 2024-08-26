#!/bin/bash

yum update -y
yum install -y nginx
fqdn=$(hostname -f)
cat <<EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Server Info</title>
</head>
<body>
    <h1>Server Hostname: $fqdn</h1>
</body>
</html>
EOF
systemctl start nginx
systemctl enable nginx
