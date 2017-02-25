#DMS Setup for MacOS
#!/bin/bash

echo "This script is used to setup DMS development environment for MacOS"
HOME=`echo ~`
if [ ! -f $HOME/.bash_profile ]
then
	`cp .bash_profile $HOME`
	echo "copied .bash_profile to $HOME"
	echo ". ~/.dms_bash_profile" >> ~/.bash_profile
fi

if [ ! -f $HOME/.dms_bash_profile  ]
then
	`cp .dms_bash_profile $HOME`
	echo "copied .dms_bash_profile to $HOME"
fi

if [ -z "$JAVA_HOME" ]
then
        echo "JAVA_HOME env variable is not set. Will exit!"
	exit 0
fi

if [ -z "$ANDROID_HOME" ]
then

	ANDROID_PATH="/Users/paris/Desktop/workspace/Android/sdk"
	echo "[WARNING] ANDROID_HOME env variable is not set. Will set it to: $ANDROID_PATH"
	printf "\nexport ANDROID_HOME=$ANDROID_PATH" >> $HOME/.dms_bash_profile
	printf "\nexport PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platforms:$ANDROID_HOME/platform-tools" >> $HOME/.dms_bash_profile
fi
