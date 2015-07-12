#!/usr/bin/env bash

set -u;
set -e;

VERSION="0.1.0";


BUNDLE_ROOT=$(cd "$(dirname "$0")"; pwd);
DIST_ROOT="$BUNDLE_ROOT/dist";



rm -rf $DIST_ROOT/*;

if [ ! -d "$DIST_ROOT" ]; then
	mkdir "$DIST_ROOT";
fi;



if [ ! -f "$DIST_ROOT/printer-driver-dell1130_${VERSION}_i386.deb" ]; then

	cd $BUNDLE_ROOT;

	if [ -d "$DIST_ROOT/i386" ]; then
		rm -rf "$DIST_ROOT/i386";
	fi;

	rsync -a ./package/i386/ "$DIST_ROOT/i386/";

	find "$DIST_ROOT/i386/" -type d -exec chmod 0755 {} \;
	find "$DIST_ROOT/i386/" -type f -exec chmod go-w {} \;
	chown -R root:root "$DIST_ROOT/i386/";


	cd $DIST_ROOT/i386/root;
	tar czf $DIST_ROOT/i386/data.tar.gz *;


	cd $DIST_ROOT/i386/DEBIAN;
	let SIZE=`du -s $DIST_ROOT/i386/root | sed s'/\s\+.*//'`+8
	sed s"/__SIZE__/${SIZE}/" -i ./control;
	sed s"/__VERSION__/${VERSION}/" -i ./control;
	tar czf "$DIST_ROOT/i386/control.tar.gz" *;


	cd $DIST_ROOT/i386;
	echo 2.0 > ./debian-binary;
	find $DIST_ROOT/i386/ -type d -exec chmod 0755 {} \;
	find $DIST_ROOT/i386/ -type f -exec chmod go-w {} \;
	chown -R root:root $DIST_ROOT/i386/;
	ar r "$DIST_ROOT/printer-driver-dell1130_${VERSION}_i386.deb" debian-binary control.tar.gz data.tar.gz;


	rm -rf "$DIST_ROOT/i386";

fi;



if [ ! -f "$DIST_ROOT/printer-driver-dell1130_${VERSION}_amd64.deb" ]; then

	cd $BUNDLE_ROOT;

	if [ -d "$DIST_ROOT/amd64" ]; then
		rm -rf "$DIST_ROOT/amd64";
	fi;

	rsync -a ./package/amd64/ "$DIST_ROOT/amd64/";

	find "$DIST_ROOT/amd64/" -type d -exec chmod 0755 {} \;
	find "$DIST_ROOT/amd64/" -type f -exec chmod go-w {} \;
	chown -R root:root "$DIST_ROOT/amd64/";


	cd $DIST_ROOT/amd64/root;
	tar czf $DIST_ROOT/amd64/data.tar.gz *;


	cd $DIST_ROOT/amd64/DEBIAN;
	let SIZE=`du -s $DIST_ROOT/amd64/root | sed s'/\s\+.*//'`+8
	sed s"/__SIZE__/${SIZE}/" -i ./control;
	sed s"/__VERSION__/${VERSION}/" -i ./control;
	tar czf "$DIST_ROOT/amd64/control.tar.gz" *;


	cd $DIST_ROOT/amd64;
	echo 2.0 > ./debian-binary;
	find $DIST_ROOT/amd64/ -type d -exec chmod 0755 {} \;
	find $DIST_ROOT/amd64/ -type f -exec chmod go-w {} \;
	chown -R root:root $DIST_ROOT/amd64/;
	ar r "$DIST_ROOT/printer-driver-dell1130_${VERSION}_amd64.deb" debian-binary control.tar.gz data.tar.gz;


	rm -rf "$DIST_ROOT/amd64";

fi;

