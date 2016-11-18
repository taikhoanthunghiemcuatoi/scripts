#/bin/bash

echo "this script will install Java on Linux"

REPO=`. ./dms_get_repo.sh`
FN=$1
FILE=$REPO/$FN
if [ ! -f "$FILE" ]
then
        echo "Not existing the file $FILE"
	exit 0
fi

DEST_PATH=/usr/java/${FN%%\.*}

if [ ! -d $DEST_PATH ]
then
	mkdir -p $DEST_PATH
fi

tar --strip-components 1 -xzvf $FILE -C $DEST_PATH

#printf "\nexport JAVA_HOME=$DEST_PATH/" >> $DMS_HOME/.dms_bash_profile
#printf "\nexport PATH=$PATH:$M2_HOME/bin" >> $DMS_HOME/.dms_bash_profile
