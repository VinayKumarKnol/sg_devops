#!/bin/bash

./install.sh
gcloud auth activate-service-account --key-file google-key.json
gcloud config set project MyFirstProject
gcloud compute --project=xenon-sentry-228607 instance-templates create instance-template-1 --machine-type=n1-standard-1 --network=projects/xenon-sentry-228607/global/networks/default --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=291917906171-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --tags=http-server,https-server --image=centos-6-v20181210 --image-project=centos-cloud --boot-disk-size=$DISKSPACE --boot-disk-type=pd-standard --boot-disk-device-name=$INSTANCENAME
