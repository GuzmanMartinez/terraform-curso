#!/bin/bash
echo "este es un mensjae" > ~/mensaje.txt
yump update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd
