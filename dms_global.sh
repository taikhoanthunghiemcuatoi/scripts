#!/bin/bash

echo "This script is used to export DMS environment variables for Linux"

USER_NAME=`whoami`

if [ -n "$1" ]
then
        USER_NAME=$1
fi

export DMS_LOGIN=`whoami`
export DMS_HOME=/$USER_NAME/dms
export DMS_BASE=$DMS_HOME/base
export DMS_CONFIG=$DMS_HOME/config
export DMS_TEMP=$DMS_HOME/temp
export DMS_SCRIPTS=$DMS_HOME/scripts
export DMS_LOG=$DMS_TEMP/log
export DMS_UPLOAD=$DMS_HOME/upload
export DMS_IMAGES=$DMS_HOME/images
export DMS_PROG=$DMS_HOME/prog
