# Prometheus

- Prometheus is an `open-source` `monitoring and alerting system` for monitoring `time-series data`. It is designed for monitoring and alerting on various metrics and events in a distributed environment.

- Prometheus is widely used for monitoring and alerting on the performance of systems, applications, and services. It can be used to monitor various metrics such as CPU usage, memory usage, and network traffic. Prometheus also allows users to create custom metrics and alerts based on the metrics they collect.

- One of the key features of Prometheus is its ability to scrape metrics from various targets, such as servers, containers, and services. Prometheus uses a pull-based model for collecting metrics, where the Prometheus server periodically scrapes metrics from the targets it monitors. This allows for a high degree of flexibility and scalability, as Prometheus can easily be configured to monitor thousands of targets.

- Prometheus also includes a powerful query language, PromQL, which allows users to perform complex queries on the metrics they collect. This allows users to create custom dashboards and alerts based on the metrics they collect.

- Prometheus also includes a built-in alerting system, which allows users to define custom alerts based on the metrics they collect. Alerts can be configured to send notifications to various destinations, such as email, Slack, or PagerDuty.

- Prometheus is often used in combination with other open-source tools, such as Grafana, for visualizing and analyzing the metrics it collects. Grafana allows users to create custom dashboards and alerts based on the metrics collected by Prometheus.

- Prometheus is also integrated with Kubernetes as part of the Kubernetes monitoring stack. This allows users to easily monitor the performance of their Kubernetes clusters and the applications running on them.

- In summary, Prometheus is a powerful open-source monitoring and alerting system that can be used to monitor and alert on various metrics and events in a distributed environment. It is widely used for monitoring and alerting on the performance of systems, applications, and services, and it can be integrated with Kubernetes and other open-source tools such as Grafana for visualizing and analyzing the metrics it collects.


# Install prometheus 
```
# add prometheus kubernetes stack int o helm repo 

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts                           

# update the Helm repo            

helm repo update 
```
```
# installing prometheus in k8s cluster

kubectl create namespace monitoring && helm install monitoring -n monitoring prometheus-community/kube-prometheus-stack
```
## installing prometheus in bare metal mac 

```
# creating a user for prometheus

sudo useradd --no-create-home --shell bin/false prometheus
```

```
#  creating directories for prometheus

sudo mkdir /etc/prometheus 
sudo mkdir /var/prometheus
```

```
# granting permission to the dir

sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/prometheus
```


```
# downloading prometheus 

wget https://github.com/prometheus/prometheus/releases/download/v2.37.5/prometheus-2.37.5.darwin-arm64.tar.gz

#  extraction and renaming 

tar -xvf ~/Download/prometheus-*
mv prometheus-* prometheus
``` 

```
# moving the binaries to /usr/local/bin

sudo cp prometheus /usr/local/bin
sudo cp promtool /usr/local/bin
```


```
# granting the prometheus user the relevant permission to access the binaries

sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
```

```
# for dashboard and visualization.

sudo cp -r consoles /etc/prometheus
sudo cp -r consoles_libraries /etc/prometheus

# updating the permissions for directories and files with in it.

sudo chown -R prometheus:prometheus /etc/prometheus/consoles

sudo chown -R prometheus:prometheus /etc/prometheus/consoles_libraries
```
```
# copy the configuration file 
sudo cp prometheus.yaml /etc/prometheus/prometheus.yaml
sudo chown -R prometheus:prometheus /etc/prometheus/prometheus.yaml
```

```
# run this command as a prometheus user

sudo -u prometheus /usr/local/bin/prometheus \
--config.file /etc/prometheus/prometheus.yml \
--storage.tsdb.path /var/lib/prometheus/ \
--web.console.templates=/etc/prometheus/consoles \
--web.console.libraries=/etc/prometheus/consoles_libraries
```

```
# create a service for the prometheus 
sudo vi /etc/systemd/system/prometheus.service

sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl status prometheus 
sudo systemctl enable prometheus

```



