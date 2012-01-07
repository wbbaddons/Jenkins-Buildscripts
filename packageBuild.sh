#!/bin/sh

[ -z $1 ] && exit 1
echo "Cleaning up\n-----------"
test -e acptemplates.tar && rm acptemplates.tar
test -e files.tar && rm files.tar
test -e templates.tar && rm templates.tar
test -e $1.tar && rm $1.tar

test -e acptemplates && echo "\nBuilding acptemplates.tar\n-------------------------" && cd acptemplates && tar cvf ../acptemplates.tar * && cd ..
test -e files && echo "\nBuilding files.tar\n------------------" && cd files && tar cvf ../files.tar * && cd ..
test -e templates && echo "\nBuilding templates.tar\n----------------------" && cd templates && tar cvf ../templates.tar * && cd ..


echo "\nBuilding $1.tar"
echo -n "-------------"
for i in `seq 1 ${#1}`;
do
		echo -n "-"
done
echo "\n"
tar cvf $1.tar * --exclude acptemplates --exclude files --exclude templates --exclude WCFSetup.tar.gz

test -e acptemplates.tar && rm acptemplates.tar
test -e files.tar && rm files.tar
test -e templates.tar && rm templates.tar

exit 0
