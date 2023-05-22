#!/bin/bash

# Create the db2_cr.yaml.  Substitute the NS variable defined in 02_setup_env.sh
cat << EOF > db2_cr.yaml
apiVersion: db2u.databases.ibm.com/v1
kind: Db2uCluster
metadata:
  name: db2ucluster-cp4ba
  labels:
    app.kubernetes.io/instance: db2u-operator
    app.kubernetes.io/managed-by: Db2U-Team
    app.kubernetes.io/name: db2u-operator
  namespace: ${NS}
spec:
  license:
    accept: true
  account:
    privileged: true
    imagePullSecrets:
      - ibm-registry
  environment:
    dbType: db2oltp
    database:
      name: ODMDB
      settings:
        codeset: UTF-8
        collation: IDENTITY
        dftPageSize: '32768'
        dftTableOrg: COLUMN
        encrypt: 'YES'
        territory: US
    instance:
      password: cicdtest
      dbmConfig:
        NUMDB: "20"
  version: "s11.5.8.0-cn2"
  storage:
    - type: create
      name: meta
      spec:
        accessModes:
          - ReadWriteMany
        resources:
          requests:
            storage: 50Gi
        storageClassName: nfs-managed-storage
    - type: template
      name: data
      spec:
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 100Gi
        storageClassName: nfs-managed-storage
  size: 1
  podConfig:
    db2u:
      resource:
        db2u:
          requests:
            cpu: 2
            memory: 8Gi
          limits:
            cpu: 2
            memory: 8Gi

  addOns:
    rest:
      enabled: false
    graph:
      enabled: false
EOF

# Apply yaml
oc apply -f db2_cr.yaml