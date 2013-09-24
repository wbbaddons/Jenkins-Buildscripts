#!/bin/sh

[ -z $PACKAGE_NAME ] && exit 1
test -e acptemplates && echo "\nBuilding acptemplates.tar\n-------------------------" && cd acptemplates && tar cvf ../acptemplates.tar * && cd ..
test -e files && echo "\nBuilding files.tar\n------------------" && cd files && tar cvf ../files.tar * && cd ..
test -e templates && echo "\nBuilding templates.tar\n----------------------" && cd templates && tar cvf ../templates.tar * && cd ..
test -e acptemplate && echo "\nBuilding acptemplate.tar\n-------------------------" && cd acptemplate && tar cvf ../acptemplate.tar * && cd ..
test -e file && echo "\nBuilding file.tar\n------------------" && cd file && tar cvf ../file.tar * && cd ..
test -e template && echo "\nBuilding template.tar\n----------------------" && cd template && tar cvf ../template.tar * && cd ..


echo "\nBuilding $PACKAGE_NAME.tar"
echo -n "-------------"
for i in `seq 1 ${#PACKAGE_NAME}`;
do
		echo -n "-"
done
echo -n "\n"
tar cvf $PACKAGE_NAME.tar * --exclude acptemplates --exclude files --exclude templates --exclude acptemplate --exclude file --exclude template --exclude test

test -e acptemplates.tar && rm acptemplates.tar
test -e files.tar && rm files.tar
test -e templates.tar && rm templates.tar
test -e acptemplate.tar && rm acptemplate.tar
test -e file.tar && rm file.tar
test -e template.tar && rm template.tar


exit 0
