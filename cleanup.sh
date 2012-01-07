#!/bin/sh

echo "Cleaning up before build\n------------------------"

# package files
test -e acptemplates.tar && rm acptemplates.tar
test -e files.tar && rm files.tar
test -e templates.tar && rm templates.tar

# package
test -e $PACKAGE_NAME.tar && rm $PACKAGE_NAME.tar

# wcf setup
test -e WCFSetup.tar.gz && rm WCFSetup.tar.gz
test -e $ZIP_NAME.zip && rm $ZIP_NAME.zip

# build directory
test -e build && rm -rf build

exit 0
