#!/bin/bash

branch=$1
version=$2
echo "[branch: $branch, version: $version]"

git branch -D $branch
git push origin --delete $branch

git checkout -b $branch
mkdir annotation
echo 'Lorem Ipsum' > annotation/$branch.zip
# echo {\"version\": \"$version\"} > package.json
echo $version > version.txt
# git add annotation package.json
git add annotation version.txt
git commit -m "CVAT commit"
git checkout master
git push -u origin $branch
