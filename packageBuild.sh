#!/bin/sh

[ -z $PACKAGE_NAME ] && exit 1
test -e acptemplates && echo "\nBuilding acptemplates.tar\n-------------------------" && cd acptemplates && tar cvf ../acptemplates.tar * && cd ..
test -e files && echo "\nBuilding files.tar\n------------------" && cd files && tar cvf ../files.tar * && cd ..
test -e templates && echo "\nBuilding templates.tar\n----------------------" && cd templates && tar cvf ../templates.tar * && cd ..


echo "\nBuilding $PACKAGE_NAME.tar"
echo -n "-------------"
for i in `seq 1 ${#PACKAGE_NAME}`;
do
		echo -n "-"
done
echo "\n"
tar cvf $PACKAGE_NAME.tar * --exclude acptemplates --exclude files --exclude templates

test -e acptemplates.tar && rm acptemplates.tar
test -e files.tar && rm files.tar
test -e templates.tar && rm templates.tar

exit 0
