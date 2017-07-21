#!/bin/bash

# Exit on any error
set -e
sudo chown -R $USER /home/ubuntu/.kube/config
sudo chown -R $USER /home/ubuntu/.config

#sudo /opt/google-cloud-sdk/bin/gcloud docker push us.gcr.io/${PROJECT_NAME}/hello
/opt/google-cloud-sdk/bin/gcloud --quiet components update kubectl

#Only needs to run the first time to ensure the deployment is there.
#kubectl create -f deploy.yml --validate=false
#kubectl apply -f loadbalancer.yml --validate=false

gcloud docker -- push us.gcr.io/${PROJECT_NAME}/hello
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl patch deployment docker-hello-google -p '{"spec":{"template":{"spec":{"containers":[{"name":"docker-hello-google","image":"us.gcr.io/gwii-cloud/hello:'"$CIRCLE_SHA1"'"}]}}}}'
