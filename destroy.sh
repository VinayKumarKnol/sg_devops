#!/bin/bash

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-230.0.0-linux-x86_64.tar.gz
tar zxvf google-cloud-sdk-230.0.0-linux-x86_64.tar.gz google-cloud-sdk
cd google-cloud-sdk
export CLOUDSDK_CORE_DISABLE_PROMPTS=1 
sh google-cloud-sdk/install.sh
source google-cloud-sdk/completion.bash.inc
source google-cloud-sdk/path.bash.inc
gcloud auth activate-service-account --key-file google-key.json
gcloud config set project MyFirstProject
gcloud compute instances delete My-instance
