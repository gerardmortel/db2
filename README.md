# Install DB2 on OpenShift on Fyre or Techzone
# https://github.ibm.com/gmortel/db2

# Resources used to create this
https://www.ibm.com/docs/en/db2/11.5?topic=operator-installing-from-command-line

# Purpose
The purpose of this repo is to install the DB2 operator and create a DB2 database on OpenShift on IBM Fyre.

# Prerequisites
1. OpenShift cluster on Fyre or Techzone
2. NFS Storage (For Fyre, try https://github.com/gerardmortel/nfs-storage-for-fyre)
3. Entitlement key https://myibm.ibm.com/products-services/containerlibrary

# Instructions
1. ssh into the infrastructure node as root (e.g. ssh root@api.slavers.cp.fyre.ibm.com)
2. yum install -y git unzip
3. cd
4. rm -f main.zip
5. rm -f db2-main
6. wget https://github.com/gerardmortel/db2/archive/refs/heads/main.zip
7. unzip main.zip
8. rm -f main.zip
9. cd db2-main
10. STOP! Put your values for variables inside file 02_setup_env.sh
11. ./01_driver.sh

#12. oc cp -c db2u db2_FN_BAW.tar c-db2ucluster-cp4ba-db2u-0:/tmp/

12. oc cp -c db2u db2_ODM.tar c-db2ucluster-cp4ba-db2u-0:/tmp/
13. oc exec -it c-db2ucluster-cp4ba-db2u-0 -- bash
14. cd /tmp

#15. tar -xvf db2_FN_BAW.tar

15. tar -xvf db2_ODM.tar
16. chmod +x *.sh
17. su - db2inst1
18. cd /tmp
19. ./create_db.sh | tee create_db.log
