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

`cp .dms_bash_profile $HOME`
echo "copied .dms_bash_profile to $HOME"

if [ -z "$JAVA_HOME" ]
then
        echo "JAVA_HOME env variable is not set. Will exit!"
	exit 0
fi
