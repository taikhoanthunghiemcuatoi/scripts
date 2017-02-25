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

if [ "`uname`" == "Darwin" ]; then
#http://apple.stackexchange.com/questions/196224/unix-ln-s-command-not-permitted-in-osx-el-capitan-beta3
	DEST_PATH=/usr/local/java/${FN%%\.*}
fi

if [ ! -d $DEST_PATH ]
then
	mkdir -p $DEST_PATH
fi

tar --strip-components 1 -xzvf $FILE -C $DEST_PATH

printf "installed $FN at $DEST_PATH\n"
#printf "\nexport JAVA_HOME=$DEST_PATH/" >> $DMS_HOME/.dms_bash_profile
#printf "\nexport PATH=$PATH:$M2_HOME/bin" >> $DMS_HOME/.dms_bash_profile
