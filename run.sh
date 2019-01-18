#!/bin/bash

gcloud auth activate-service-account --key-file google-key.json
gcloud config set project xenon-sentry-228607
IP=$(gcloud compute instances list | awk '/'instance-template-1'/ {print $5}')
if [ -z $IP ]
then
echo "Create Instance"
gcloud compute instances create instance-template-1 --zone=us-east1-b --machine-type=n1-standard-1 --subnet=default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=291917906171-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --image=centos-6-v20181210 --image-project=centos-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=instance-template-1
else
echo "Destroy Instance"
gcloud compute instances delete instance-template-1 --zone=us-east1-b
fi
