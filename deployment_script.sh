#!/bin/bash

# Ensure the script exits if any command fails
set -e

cd /Users/seanbearden/PycharmProjects/customer-support-bot

# Define variables
REGION="us-central1"
PROJECT="customer-service-bot-432720"
# Set your project and authenticate
gcloud config set account sean@beardendatasolutionsllc.com
gcloud config set project $PROJECT
gcloud auth application-default set-quota-project $PROJECT

# Uncomment to create
#
#gcloud services enable vpcaccess.googleapis.com
#gcloud services enable compute.googleapis.com
#gcloud compute networks create my-vpc --subnet-mode=custom
#
#gcloud compute networks vpc-access connectors create my-connector \
#  --network my-vpc \
#  --region $REGION \
#  --range 10.8.0.0/28
#
#gcloud compute routers create my-router \
#  --network my-vpc \
#  --region $REGION
#
#gcloud compute addresses create my-static-ip \
#  --region $REGION
#
#gcloud compute routers nats create my-nat-config \
#  --router-region $REGION \
#  --router my-router \
#  --nat-all-subnet-ip-ranges \
#  --nat-external-ip-pool my-static-ip


# Reserve Static IP (only needed once)
#gcloud compute addresses create beam-bot-static-ip --global

# Create VPC Network and Subnet (only needed once)
#gcloud compute networks create beam-bot-vpc --subnet-mode=custom
#gcloud compute networks subnets create beam-bot-subnet --network=beam-bot-vpc --region=$REGION --range=10.0.0.0/24

# Setup Cloud Router and NAT (only needed once)
#gcloud compute routers create beam-bot-router --network=beam-bot-vpc --region=$REGION
#gcloud compute routers nats create beam-bot-nat --router=beam-bot-router --auto-allocate-nat-external-ips --nat-all-subnet-ip-ranges --region=$REGION
#gcloud compute routers nats create beam-bot-nat --router=beam-bot-router --nat-all-subnet-ip-ranges --region=$REGION --nat-external-ip-pool beam-bot-static-ip


## Build the Docker image
#gcloud builds submit --tag gcr.io/beam-bot-432317/beam-bot
#
## Deploy to Cloud Run with VPC Connector
#gcloud run deploy beam-bot \
#  --image gcr.io/beam-bot-432317/beam-bot \
#  --platform managed \
#  --region $REGION \
#  --allow-unauthenticated \
#  --memory 4Gi \
#  --cpu 2 \
#  --execution-environment gen2 \
#  --vpc-connector my-connector \
#  --vpc-egress all \
#  --min-instances 1 \
#  --max-instances 5