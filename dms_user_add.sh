#!/bin/bash
echo "this script is used to setup the  DMS environment for a new user"

USER_NAME=$1

if [ -n "`grep $USER_NAME /etc/passwd`" ]
then
        echo "The user $USER_NAME is existing. Will exit the script!"
        exit 0
fi

#DMS_HOME=/$1/dms
#DMS_BASE=$DMS_HOME/base
#DMS_CONFIG=$DMS_HOME/config
#DMS_TEMP=$DMS_HOME/temp
#DMS_SCRIPTS=$DMS_HOME/scripts
#DMS_LOG=$DMS_TEMP/log
#DMS_UPLOAD=$DMS_HOME/upload
#DMS_IMAGES=$DMS_HOME/images

echo "will create a new user: $USER_NAME"
mkdir -p $DMS_HOME
ENCRYPTED_PASS=`openssl passwd -crypt mypasswOrd`
useradd -d $DMS_HOME -p $ENCRYPTED_PASS $USER_NAME
echo "created"

echo "will create subdirs in the dir $DMS_HOME"
mkdir -p $DMS_BASE
mkdir -p $DMS_CONFIG
mkdir -p $DMS_TEMP
mkdir -p $DMS_SCRIPTS
mkdir -p $DMS_LOG
mkdir -p $DMS_UPLOAD
mkdir -p $DMS_IMAGES
echo "created"

echo "will change mode and owner of the dir $DMS_HOME and its subdirs"
chmod -R 744 $DMS_HOME
chown -hR $USER_NAME $DMS_HOME
echo "changed"
