#!/bin/bash

# dell-1130 printer driver for Ubuntu (12.04+)
#
# Copyright (c) 2012 by Christoph Martens
#
# released under WTFPL
#

UNAME_P=$(uname -p);
WHOAMI=$(whoami);

SOURCE_PATH=$(cd "$(dirname "$0")"; pwd);
FILTER_PATH="/usr/lib/cups/filter";
TARGET_PATH="$FILTER_PATH/rastertosamsungspl";

success=0;

check_success() {

	if [ ! "$?" -eq "0" ]
	then
		finish "An unexpected ERROR occured, is CUPS properly installed?";
	fi;

}

finish() {

	if [ "$1" != "" ]
	then
		echo -e "$1";
	fi;

	exit 1;

}


if [ "$WHOAMI" != "root" ]
then
	finish "\nYou are not root. Execute:\nsudo $0\n";
fi;


if [ "$UNAME_P" == "x86_64" ]
then

	cp $SOURCE_PATH/x86_64-rastertosamsungspl $TARGET_PATH 2>&1;
	check_success;

	cd $FILTER_PATH 2>&1;
	check_success;

	chown root:root rastertosamsungspl 2>&1;
	check_success;

	chmod 0755 rastertosamsungspl 2>&1;
	check_success;

	success=1;

elif [ "$UNAME_P" == "i686" ]
then

	cp $SOURCE_PATH/i686-rastertosamsungspl $TARGET_PATH 2>&1;
	check_success;

	cd $FILTER_PATH 2>&1;
	check_success;

	chown root:root rastertosamsungspl 2>&1;
	check_success;

	chmod 0755 rastertosamsungspl 2>&1;
	check_success;

	success=1;

fi;


if [ "$success" == "1" ]
then
	echo -e "\nEverything went well, the rasterizer is now installed.";
	echo -e "Install the printer in CUPS now, see README for details on how to do this.";
	echo -e "";
fi;

