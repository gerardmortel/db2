#!/bin/bash

# Set up environment variables

# Get entitlement key from https://myibm.ibm.com/products-services/containerlibrary
export API_KEY_GENERATED=""
export USER_EMAIL="gmortel@us.ibm.com"
export NS=cp4ba

# Example DB2 CASE file info
# https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-db2uoperator/5.1.4/ibm-db2uoperator-5.1.4.tgz
export CASE_NAME=ibm-db2uoperator
export CASE_VERSION=5.1.4
export OFFLINECASE=/tmp/case
export CASEPATH="https://github.com/IBM/cloud-pak/raw/master/repo/case"
export OFFLINECASE=${OFFLINECASE}/${CASE_NAME}
export CASE_ARCHIVE=${CASE_NAME}-${CASE_VERSION}.tgz
