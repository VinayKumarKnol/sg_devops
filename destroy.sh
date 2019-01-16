#!/bin/bash

gcloud auth activate-service-account --key-file google-key.json
gcloud compute instances delete instance-template-1
