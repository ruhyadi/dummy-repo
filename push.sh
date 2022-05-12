#!/bin/bash
# sh push.sh branch version

branch=$1
version=$2
echo "[branch: $branch, version: $version]"

git branch -D $branch
git push origin --delete $branch

git checkout -b $branch
mkdir annotation
echo 'Lorem Ipsum' > annotation/$branch.zip
echo $version > version.txt
# git add annotation version.txt
git add annotation
git commit -m "CVAT commit"
git checkout master
git push -u origin $branch
