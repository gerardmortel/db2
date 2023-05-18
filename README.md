# Install DB2 on OpenShift on Fyre
# https://github.ibm.com/gmortel/db2

1. ssh into the infrastructure node as root (e.g. ssh root@api.slavers.cp.fyre.ibm.com)
2. yum install -y git
3. git clone https://github.com/gerardmortel/db2.git
4. cd db2
5. Put your values for API_KEY_GENERATED, USER_EMAIL, NS and CASE_VERSION inside file 02_setup_env.sh
6. ./01_driver.sh