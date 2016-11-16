#!/bin/bash

echo "This script is used to setup DMS development environment for Linux"

USER_NAME=$1

if [ -z $USER_NAME ]
then
        echo "First argument for username is required. Please re-run the script again"
        exit 0
fi

. ./dms_global.sh $USER_NAME
. ./dms_user_add.sh $USER_NAME

if [ ! -f $DMS_HOME/.bash_profile ]
then
        cp .bash_profile $DMS_HOME
	chown $USER_NAME $DMS_HOME/.bash_profile
        echo "copied .bash_profile to $DMS_HOME"
	printf "\n. ~/.dms_bash_profile" >> $DMS_HOME/.bash_profile
fi

cp .dms_bash_profile $DMS_HOME
chown $USER_NAME $DMS_HOME/.dms_bash_profile
echo "copied .dms_bash_profile to $DMS_HOME"

cp dms_global.sh $DMS_HOME
chown $USER_NAME $DMS_HOME/dms_global.sh
echo "copied dms_global.sh to $DMS_HOME"

echo "DMS Setup is done!. please exit the terminal and re-open again to get effect!"
