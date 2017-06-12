#!/bin/sh

xcodebuild -version | grep -q "Xcode 9"
if [ $? -ne 0 ]
then
    echo "Please install Xcode 9 and select it using xcode-select"
    exit 1
fi

gyp/gyp --depth=. --generator-output=ide ./test.gyp
xcodebuild -project ide/test.xcodeproj
xcodebuild -project ide/test.xcodeproj -UseNewBuildSystem=YES
