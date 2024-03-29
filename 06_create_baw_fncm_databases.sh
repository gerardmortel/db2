#!/bin/bash

# Check if db2ucluster pod is running and ready every 10 seconds
oc project ${NS}
while [ true ]
do
  oc get pods | grep "c-db2ucluster-cp4ba-db2u-0" | grep "Running" | grep "1/1"
  if [ $? -eq 0 ]; then
    echo "=============================================================================="
    echo "=================== db2ucluster IS available. ================================"
    echo "=============================================================================="
    break
  else
    echo "db2ucluster is NOT available."
    echo "Sleeping for 10 seconds"
    sleep 10
  fi
done

# Copy db2 tar file to db2ucluster
# oc cp -c db2u db2_FN_BAW.tar c-db2ucluster-cp4ba-db2u-0:/tmp/

# # Exec into db2ucluster pod and untar db scripts
# oc exec -it c-db2ucluster-cp4ba-db2u-0 -- bash
# cd /tmp
# tar -xvf db2_FN_BAW.tar
# chmod +x *.sh

# # Run the db2 create databases script, keep a log file of output
# su - db2inst1
# cd /tmp
# ./create_db.sh | tee create_db.log


## Notes
# oc exec c-db2ucluster-cp4ba-db2u-0 -- tar -xvf /tmp/db2_FN_BAW.tar
# oc exec c-db2ucluster-cp4ba-db2u-0 -- chmod +x  /tmp/*.sh