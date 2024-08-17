#!/bin/bash

# Ensure the script exits if any command fails
set -e

cd /PATH/TO/DIRECTORY

# Define variables
EMAIL="YOUR_ACCOUNT_EMAIL"
REGION="YOUR_REGION"
PROJECT="YOUR_PROJECT_ID"

# Set your project and authenticate
gcloud config set account $EMAIL
gcloud config set project $PROJECT
gcloud auth application-default set-quota-project $PROJECT
