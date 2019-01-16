#!/bin/bash

gcloud alpha projects delete
gcloud auth activate-service-account --key-file google-key.json
gcloud config set project MyFirstProject
