#!/bin/bash

# Set up environment variables

# Get entitlement key from https://myibm.ibm.com/products-services/containerlibrary
export API_KEY_GENERATED=""
export USER_EMAIL=""
export NS=""

# Example DB2 CASE file info
# https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-db2uoperator/5.1.4/ibm-db2uoperator-5.1.4.tgz
export CASE_NAME=""
export CASE_VERSION=""
export OFFLINECASE=""
export CASEPATH=""
export OFFLINECASE=${OFFLINECASE}/${CASE_NAME}
export CASE_ARCHIVE=${CASE_NAME}-${CASE_VERSION}.tgz

export STORAGECLASS=""
