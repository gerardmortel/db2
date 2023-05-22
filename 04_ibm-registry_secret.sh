#!/bin/bash

# Switch to project defined in 02_setup_env.sh
oc project ${NS}

# Create the ibm-registry secret.  This is used in 05_create_db2cluster.sh db2_cr.yaml
oc delete secret ibm-registry
oc create secret docker-registry ibm-registry \
--docker-server=cp.icr.io \
--docker-username=cp \
--docker-password="${API_KEY_GENERATED}" \
--docker-email=${USER_EMAIL}
