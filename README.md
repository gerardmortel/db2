# Install DB2 on OpenShift on Fyre
# https://github.ibm.com/gmortel/db2

# Resources used to create this
https://www.ibm.com/docs/en/db2/11.5?topic=operator-installing-from-command-line

# Purpose
The purpose of this repo is to install the DB2 operator and create a DB2 database on OpenShift on IBM Fyre.

# Prerequisites
1. OpenShift cluster on Fyre
2. NFS Storage configured https://github.com/gerardmortel/nfs-storage-for-fyre
3. Entitlement key https://myibm.ibm.com/products-services/containerlibrary

# Instructions
1. ssh into the infrastructure node as root (e.g. ssh root@api.slavers.cp.fyre.ibm.com)
2. yum install -y git unzip
3. cd
4. rm -f main.zip
5. wget https://github.com/gerardmortel/db2/archive/refs/heads/main.zip
6. unzip main.zip
7. rm -f main.zip
8. cd db2-main
9. Put your values for API_KEY_GENERATED, USER_EMAIL, NS and CASE_VERSION inside file 02_setup_env.sh
10. ./01_driver.sh
