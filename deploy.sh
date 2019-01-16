#!/bin/bash

gcloud auth activate-service-account --key-file google-key.json
gcloud config set project MyFirstProject
sleep 2

