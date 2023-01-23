# generate certificate 
```
 sudo openssl req -new -newkey rsa:2048 -day 365 -nodes -x509 -keyout node_exporter.key -out node_exporter.crt -subj "/C=US/ST=California/L=Oakland/O=MyOrg/CN=localhost" -addext "subjectAltName = DNS:localhost 
 
 ./node_exporter --web.config=config.yaml
 ```