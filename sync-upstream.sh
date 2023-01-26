#!/bin/bash

echo "Committing any changes ..."
git add .
git commit "changes and updates"

echo "Merging upstream changes. Accepting my changes for lua/user/init.lua ..."
git fetch
git merge upstream/master
git checkout --ours lua/user/init.lua
git commit -am "Merge upstream"
git push

echo "DONE!"
