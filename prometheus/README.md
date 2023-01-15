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



