#!/bin/bash

USER_NAME=$1
echo "this script is used to delete the  DMS environment for the user $USER_NAME"

if [ -z "`grep $USER_NAME /etc/passwd`" ]
then
        echo "The user $USER_NAME is not  existing. Will exit the script!"
        exit 0
fi

DMS_HOME=/$USER_NAME/dms

echo "will delete the user: $USER_NAME"
userdel $USER_NAME
echo "deleted"

echo "will delete the dir $DMS_HOME and its subdirs"
rm -rf $DMS_HOME
echo "deleted"
