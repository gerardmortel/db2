#!/bin/bash

# From https://www.ibm.com/docs/en/db2/11.5?topic=operator-installing-from-command-line

# Example DB2 CASE file info
# https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-db2uoperator/5.1.4/ibm-db2uoperator-5.1.4.tgz

# Set up environment variables
export CASE_NAME=ibm-db2uoperator
export CASE_VERSION=5.1.4
export OFFLINECASE=/tmp/case
export CASEPATH="https://github.com/IBM/cloud-pak/raw/master/repo/case"
export OFFLINECASE=${OFFLINECASE}/${CASE_NAME}
export CASE_ARCHIVE=${CASE_NAME}-${CASE_VERSION}.tgz
export NS=cp4ba

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
