#!/bin/sh

[ -z $PACKAGE_NAME ] && exit 1
[ -z $ZIP_NAME ] && exit 1
[ ! -e "$PACKAGE_NAME.tar" ] && exit 1
[ ! -e "build/wcf.zip" ] && exit 1

echo "\nPreparing WCF Setup structure"
echo "-----------------------------"
cd build
mkdir wcfsetup
unzip wcf.zip -d wcfsetup
rm wcf.zip
cd wcfsetup
rm LICENSE
rm README.md
echo -n "Extracting WCFSetup.tar.gz ..."
tar -xzf WCFSetup.tar.gz
rm WCFSetup.tar.gz
test -e ../../wcfsetup && cp -R ../../wcfsetup/* ./
cp ../../$PACKAGE_NAME.tar install/packages/$PACKAGE_NAME.tar

echo "\nBuilding WCFSetup.tar.gz"
echo "------------------------"
tar cvzf WCFSetup.tar.gz install setup
cp *.php ../../
cp WCFSetup.tar.gz ../../
cd ..
rm -rf wcfsetup
cd ..

echo "\nBuilding $ZIP_NAME.zip"
echo "------------------------"
test -e COPYING && ADDITIONAL_FILES="$ADDITIONAL_FILES COPYING"
test -e LICENSE && ADDITIONAL_FILES="$ADDITIONAL_FILES LICENSE"
test -e README && ADDITIONAL_FILES="$ADDITIONAL_FILES README"
test -e README.md && ADDITIONAL_FILES="$ADDITIONAL_FILES README.md"
zip $ZIP_NAME.zip WCFSetup.tar.gz *.php $ADDITIONAL_FILES
rm *.php

exit 0
