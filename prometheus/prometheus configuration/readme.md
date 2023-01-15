# prometheus configuration file 

## /etc/prometheus
`prometheus.yaml`
```
# my global config
global: true

scrape_configs:
 - job_name: "prometheus"
   static_config:
    -target: ["localhost:9000"]
```



# node exporter

`configuration.yaml`
```
global:
  scrape_interval: 1m
  scrape_timeout: 10s

 # Default parameter for all other config section




scrape_configs:
    - job_name: 'node'  
      scrape_interval: 15s
      scrape_timeout: 5s
      sample_limit: 1000
      static_configs:
        - targets: ['172.16.12.1:9090']



#  Define targets and configs for metrics collection    



#configuration related to AlertManager
alerting:


#Rule files specifies a list of files rules are read from

rule_files:

#Settings related to the remote read/write feature.
remote_read:
remote_write:

#Storage related settings 
storage:

```


## basic scrape configs syntax


``` 
scrape_configs:
  # How frequently to scrape targets from this job.

  [ scrape_interval: <duration> | default  = <global_config.scrape_interval> ]

  #Per-scrape timeout when scraping this job.

  [ scrape_timeout: <durations> | default = <global_config.scrape_timeout> ]

  # The HTTP resource path on which to fetch metrics from targets.

  { metrics_path:<path> | default = /metric}

  # Configures the protocol scheme used for requests.
  [ scheme: <scheme> | default = http]

  # Sets the 'Authorization' header on every scrape request with the 
  # configured username and password. 
  # password and password_file are mutually exclusive.

  basic_auth:
    [ username" <string> ]
    [ password" <string> ]
    [ password_file" <string> ]

```

## to reflect the changes that are made on the configuration restart the prometheus 

```
sudo systemctl restart prometheus

```