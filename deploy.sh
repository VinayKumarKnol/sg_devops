#!/bin/bash

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-230.0.0-linux-x86_64.tar.gz
tar zxvf google-cloud-sdk-230.0.0-linux-x86_64.tar.gz google-cloud-sdk
cd google-cloud-sdk
export CLOUDSDK_CORE_DISABLE_PROMPTS=1 
sh google-cloud-sdk/install.sh
source google-cloud-sdk/completion.bash.inc
source google-cloud-sdk/path.bash.inc
gcloud auth activate-service-account --key-file google-key.json
gcloud compute --project=xenon-sentry-228607 instance-templates create instance-template-1 --machine-type=n1-standard-1 --network=projects/xenon-sentry-228607/global/networks/default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=291917906171-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --image=centos-6-v20181210 --image-project=centos-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=My-instance

gcloud compute --project=xenon-sentry-228607 firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server

gcloud compute --project=xenon-sentry-228607 firewall-rules create default-allow-https --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:443 --source-ranges=0.0.0.0/0 --target-tags=https-server
