#!/usr/bin/bash
sudo cp /home/ubuntu/DEV_OPS/AWS/CICD/Project-2/gunicorn/gunicorn.socket  /etc/systemd/system/gunicorn.socket
sudo cp /home/ubuntu/DEV_OPS/AWS/CICD/Project-2/gunicorn/gunicorn.service  /etc/systemd/system/gunicorn.service

sudo systemctl start gunicorn.service
sudo systemctl enable gunicorn.service
