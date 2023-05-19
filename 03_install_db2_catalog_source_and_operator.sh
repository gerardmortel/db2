#!/bin/bash

# Download cloudctl
curl -L https://github.com/IBM/cloud-pak-cli/releases/latest/download/cloudctl-linux-amd64.tar.gz -o cloudctl-linux-amd64.tar.gz
curl -L https://github.com/IBM/cloud-pak-cli/releases/latest/download/cloudctl-linux-amd64.tar.gz.sig -o cloudctl-linux-amd64.tar.gz.sig

# Extract cloudctl
tar -xvf cloudctl-linux-amd64.tar.gz

# Copy cloudctl to /usr/bin directory which in the PATH and rename to cloudctl
cp cloudctl-linux-amd64 /usr/bin/cloudctl

# From https://www.ibm.com/docs/en/db2/11.5?topic=operator-installing-from-command-line

oc new-project ${NS}

# Create a directory to save the CASE bundle to a local directory:
rm -rf ${OFFLINECASE}
mkdir -p ${OFFLINECASE}

# Download the CASE bundle
cloudctl case save --repo ${CASEPATH} --case ${CASE_NAME} --version ${CASE_VERSION} --outputdir ${OFFLINECASE}

# Verify that the CASE bundle and images csv have been downloaded:
ls ${OFFLINECASE}

# Extract the CASE bundle
cd ${OFFLINECASE}
tar -xvzf ${CASE_ARCHIVE}

# Install the Db2® catalog
cloudctl case launch                        \
    --case ${OFFLINECASE}/${CASE_NAME}                   \
    --namespace openshift-marketplace       \
    --inventory db2uOperatorSetup           \
    --action installCatalog

# Install the Db2 operator
cloudctl case launch                         \
     --case ${OFFLINECASE}/${CASE_NAME}                   \
     --namespace ${NS}                       \
     --inventory db2uOperatorStandaloneSetup \
     --action installOperator
