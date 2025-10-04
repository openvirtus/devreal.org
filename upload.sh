#!/bin/sh -e
if test ! -n "$1"; then
    echo "error: Please specify a destination." >&2
    exit 1
fi
cd "$1"
rm -rf .git
git init
git remote add origin https://github.com/openvirtus/openvirtus.github.io
git add pkg docs
git commit -a -m upload
git push -f --set-upstream origin master
