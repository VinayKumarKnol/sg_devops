#!/bin/bash

gcloud auth activate-service-account --key-file key.json
gcloud config set project MyFirstProject
sleep 2

