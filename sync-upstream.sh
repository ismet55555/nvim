#!/bin/bash

UPSTREAM_SOURCE="https://github.com/AstroNvim/AstroNvim.git"

# Check if upstream remote is defined
if ! git remote -v | grep -q upstream; then
    git remote add upstream ${UPSTREAM_SOURCE}
    echo "Successfully 'upstream' remote has been defined"
fi

echo "Committing any changes ..."
git add .
git commit "changes and updates"

echo "Pulling any remote changes ..."
git config pull.rebase false
git pull
git checkout --their .

echo "Merging upstream changes. Accepting my changes for lua/user/init.lua ..."
git fetch
git merge upstream/master
git checkout --ours lua/user/init.lua
git commit -am "Merge upstream"

echo "Pushing changes ..."
git push

echo "DONE!"
