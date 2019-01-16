#!/bin/bash

./install.sh
gcloud auth activate-service-account --key-file google-key.json
gcloud config set project MyFirstProject
gcloud compute instances delete $INSTANCENAME
