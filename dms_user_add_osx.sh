#!/bin/bash

echo "this script is used to create a new OSX  user"

USER_NAME=$1
OSX_USER=/Users/$USER_NAME

. ./dms_check_DMS_HOME.sh

if [ "$USER_NAME" == "" ]
then
	printf "Please enter username. Use: adduser <username>\n"
	exit 1
fi

maxid=$(dscl . -list /Users UniqueID | awk '{print $2}' | sort -ug | tail -1)
newid=$((maxid+1))
maxgroupid=$(dscl . -list /groups PrimaryGroupID | awk '{print $2}' | sort -ug | tail -1)
newgroupid=$((maxgroupid+1))
admingroupid=80
everyonegroupid=12
staffgroupid=20

dscl . -create $OSX_USER
dscl . -create $OSX_USER UserShell /bin/bash
dscl . -create $OSX_USER UniqueID $newid
dscl . -create $OSX_USER PrimaryGroupID $admingroupid
dscl . -create $OSX_USER NFSHomeDirectory $DMS_HOME
dscl . -passwd $OSX_USER mypasswOrd
dscl . -append /Groups/admin GroupMembership $USER_NAME

mkdir -p $DMS_HOME
echo "will create subdirs in the dir $DMS_HOME"
mkdir -p $DMS_BASE
mkdir -p $DMS_CONFIG
mkdir -p $DMS_TEMP
mkdir -p $DMS_SCRIPTS
mkdir -p $DMS_LOG
mkdir -p $DMS_UPLOAD
mkdir -p $DMS_IMAGES
mkdir -p $DMS_PROG
echo "created"

echo "will change mode and owner of the dir $DMS_HOME and its subdirs"
chown -hR $USER_NAME $DMS_HOME
chgrp -R $admingroupid $DMS_HOME
echo "changed"

printf "Created user '$USER_NAME' at $DMS_USER_HOME\n"
