#!/bin/bash

branch=$1
version=$2
echo "[branch: $branch, version: $version]"

git branch -d $branch
git push origin --delete $branch

git checkout -b $branch
mkdir annotation
echo 'Lorem Ipsum' > annotation/$branch.zip
echo {\"version\": \"$version\"} > package.json
git add annotation package.json
git commit -m "CVAT commit"
git checkout master
git push -u origin $branch
