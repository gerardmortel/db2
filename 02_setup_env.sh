#!/bin/bash

# Set up environment variables
# Higher priority variables
export API_KEY_GENERATED="" # Get entitlement key from https://myibm.ibm.com/products-services/containerlibrary
export USER_EMAIL="" # docker email address
export NS="" # cp4ba
export STORAGECLASS="" # managed-nfs-storage

# Lower priority variables
# Example DB2 CASE file info
# https://github.com/IBM/cloud-pak/raw/master/repo/case/ibm-db2uoperator/5.1.4/ibm-db2uoperator-5.1.4.tgz
export CASE_NAME="" # ibm-db2uoperator
export CASE_VERSION="" # 5.1.4
export OFFLINECASE="" # /tmp/case
export CASEPATH="" # https://github.com/IBM/cloud-pak/raw/master/repo/case
export OFFLINECASE=${OFFLINECASE}/${CASE_NAME}
export CASE_ARCHIVE=${CASE_NAME}-${CASE_VERSION}.tgz
