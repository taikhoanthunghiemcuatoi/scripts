#/bin/bash

echo "this script will download and setup Maven on Linux"

MVN_DOWNLOAD_URL='http://mirror.downloadvn.com/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz'
MVN_FN='apache-maven-3.3.9-bin.tar.gz'
MVN_HOME=$DMS_HOME/prog/maven
M2_HOME=$MVN_HOME/apache-maven-3.3.9

CURR_DIR=`pwd`
cd $DMS_TEMP
wget $MVN_DOWNLOAD_URL
echo "downloaded the file to $DMS_TEMP"
if [ ! -d $MVN_HOME ]
then
	mkdir -p $MVN_HOME
fi
tar -xzvf $DMS_TEMP/$MVN_FN -C $MVN_HOME
printf "\nexport M2_HOME=$M2_HOME" >> $DMS_HOME/.dms_bash_profile
printf "\nexport PATH=$PATH:$M2_HOME/bin" >> $DMS_HOME/.dms_bash_profile
cd $CURR_DIR
