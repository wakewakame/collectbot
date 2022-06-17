#!/bin/bash

set -eu

LIST=$(cat list.txt)

mkdir -p repos
cd repos

for URL in $LIST; do
	USER=$(echo $URL | sed -e "s/^https:\\/\\/github.com\\/\\([^\\/]*\\)\\/\\([^\\/]*\\)$/\\1/")
	REPO=$(echo $URL | sed -e "s/^https:\\/\\/github.com\\/\\([^\\/]*\\)\\/\\([^\\/]*\\)$/\\2/")
	if [ ! -d $REPO ]; then
		git clone "git@github.com:$USER/$REPO.git"
	fi
	cd $REPO
	echo $REPO
	git pull
	git submodule update --init --recursive
	cd ../
done

cd ../
tar -cvf repos.tar repos
