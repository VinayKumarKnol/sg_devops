#!/bin/bash

gcloud auth activate-service-account --key-file google-key.json
gcloud compute instances delete INSTANCE_NAMES instance-template-1
