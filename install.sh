#!/bin/bash

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-230.0.0-linux-x86_64.tar.gz
tar zxvf google-cloud-sdk-230.0.0-linux-x86_64.tar.gz google-cloud-sdk
cd google-cloud-sdk
CLOUDSDK_CORE_DISABLE_PROMPTS=1 ./install.sh

gcloud auth activate-service-account --key-file google-key.json
gcloud config set project MyFirstProject
