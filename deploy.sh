#!/bin/bash

# Exit on any error
#set -e
sudo chown -R $USER /home/ubuntu/.config
#sudo /opt/google-cloud-sdk/bin/gcloud docker push us.gcr.io/${PROJECT_NAME}/hello
/opt/google-cloud-sdk/bin/gcloud --quiet components update kubectl
gcloud docker -- push us.gcr.io/${PROJECT_NAME}/hello
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment cms-cluster -p '{"spec":{"template":{"spec":{"containers":[{"name":"docker-hello-google","image":"us.gcr.io/gwii-cloud/hello:'"$CIRCLE_SHA1"'"}]}}}}'
