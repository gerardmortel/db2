#!/bin/bash

. ./02_setup_env.sh
./03_install_db2_catalog_source_and_operator.sh
./04_ibm-registry_secret.sh
./05_create_db2ucluster.sh
./06_create_baw_fncm_databases.sh
