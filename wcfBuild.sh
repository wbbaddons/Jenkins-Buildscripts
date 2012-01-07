#!/bin/sh

# Building WCFSetup.tar.gz

cd ./com.woltlab.wcf/template/
tar -cf ../template.tar *
cd ../
tar -cf ../wcfsetup/install/packages/com.woltlab.wcf.tar * --exclude=template
rm template.tar
cd ../wcfsetup
tar -czf ../WCFSetup.tar.gz install setup
rm install/packages/com.woltlab.wcf.tar
