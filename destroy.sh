#!/bin/bash

gcloud auth activate-service-account --key-file google-key.json
gcloud compute --project=xenon-sentry-228607 instances delete instance-template-1 --zone=us-east1-b
