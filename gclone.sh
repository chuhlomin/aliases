#!/bin/bash
#
# gclone is a wrapper on top of the `git clone` command, it:
# 1. parses the URL
# 2. creates "owner" directory in ~/Projects/
# 3. clones repository into ~/Projects/<owner>/<repo>
#
# Usage:
# gclone git@github.com:chuhlomin/terraform.git
# gclone https://github.com/chuhlomin/terraform.git
#
# Install:
# chmod +x gclone.sh
# mv gclone.sh /usr/local/bin/gclone
#
# License: GPL v3.0 https://opensource.org/licenses/GPL-3.0
# Author: Konstantin Chukhlomin
# Version: 1.0

PROJECTS_DIR=~/Projects

IFS=':/.' read -ra ADDR <<< "$1"

if [ ${#ADDR[@]} == 5 ] # for URLs like git@github.com:chuhlomin/homepage.git
then
    OWNER=${ADDR[2]}
    REPO=${ADDR[3]}
elif [ ${#ADDR[@]} == 8 ] # for URLs like # https://github.com/chuhlomin/homepage.git
then
    OWNER=${ADDR[5]}
    REPO=${ADDR[6]}
else
    echo "Unrecognized repository URL"
fi

mkdir -p $PROJECTS_DIR/$OWNER

git clone $1 $PROJECTS_DIR/$OWNER/$REPO
