#!/bin/sh

[ -z $1 ] && exit 1
[ -z $2 ] && exit 1
#[ ! -e "$1.tar" ] && exit 1

echo "Cleaning up\n-----------"
test -e $2.zip && rm $2.zip
test -e build/wcfsetup/WCFSetup.tar.gz && rm build/wcfsetup/WCFSetup.tar.gz
test -e build/wcfsetup/instell/$1.tar && rm build/wcfsetup/instell/$1.tar

cp $1.tar build/wcfsetup/install/packages/$1.tar
test -e wcfsetup && cp -R wcfsetup/* build/wcfsetup/

echo "\nBuilding WCFSetup.tar.gz"
echo "------------------------"
cd build/wcfsetup
tar cvzf WCFSetup.tar.gz install setup
test -e build/wcfsetup/install/packages/$1.tar && rm build/wcfsetup/install/packages/$1.tar
cp *.php ../../
cp WCFSetup.tar.gz ../../
cd ../..

echo "\nBuilding $2.zip"
echo "------------------------"
test -e COPYING && ADDITIONAL_FILES="$ADDITIONAL_FILES COPYING"
test -e LICENSE && ADDITIONAL_FILES="$ADDITIONAL_FILES LICENSE"
test -e README && ADDITIONAL_FILES="$ADDITIONAL_FILES README"
test -e README.md && ADDITIONAL_FILES="$ADDITIONAL_FILES README.md"
zip $2.zip WCFSetup.tar.gz *.php $ADDITIONAL_FILES
rm *.php

exit 0
