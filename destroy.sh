#!/bin/bash

gcloud auth activate-service-account --key-file key.json
gcloud compute instances delete instance-template-1
