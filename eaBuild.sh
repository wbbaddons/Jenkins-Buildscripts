#!/bin/sh

[ -z $PACKAGE_NAME ] && exit 1
[ -z $ZIP_NAME ] && exit 1
[ ! -e "$PACKAGE_NAME.tar" ] && exit 1

test -e wcfsetup && cp -R wcfsetup/* build/wcfsetup/
cp $PACKAGE_NAME.tar build/wcfsetup/install/packages/$PACKAGE_NAME.tar

echo "\nBuilding WCFSetup.tar.gz"
echo "------------------------"
cd build/wcfsetup
tar cvzf WCFSetup.tar.gz install setup
rm build/wcfsetup/install/packages/$PACKAGE_NAME.tar
cp *.php ../../
cp WCFSetup.tar.gz ../../
cd ../..

echo "\nBuilding $ZIP_NAME.zip"
echo "------------------------"
test -e COPYING && ADDITIONAL_FILES="$ADDITIONAL_FILES COPYING"
test -e LICENSE && ADDITIONAL_FILES="$ADDITIONAL_FILES LICENSE"
test -e README && ADDITIONAL_FILES="$ADDITIONAL_FILES README"
test -e README.md && ADDITIONAL_FILES="$ADDITIONAL_FILES README.md"
zip $ZIP_NAME.zip WCFSetup.tar.gz *.php $ADDITIONAL_FILES
rm *.php

exit 0
