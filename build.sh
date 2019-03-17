#!/usr/bin/env bash

VERSION=$1

echo $VERSION

SONAR_CLI_ZIP=sonar-scanner-cli-$VERSION-linux.zip
SONAR_CLI_DIR=sonar-scanner-$VERSION-linux

rm -rf .tmp

mkdir .tmp
cd .tmp

wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/$SONAR_CLI_ZIP
unzip $SONAR_CLI_ZIP

cd ..

rm -rf bin conf jre lib

mv .tmp/$SONAR_CLI_DIR/* ./

git add .
git commit -m "v$VERSION"
git push origin HEAD
git tag v$VERSION
git push origin v$VERSION
