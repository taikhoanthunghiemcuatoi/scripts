#!/bin/bash

echo "This script is used to check DMS_HOME env variable is existing or not!"

if [ -z "$DMS_HOME" ]
then
        printf "no DMS_HOME env var found. Please run the dms_global.sh script first\n"
        exit 1
fi
