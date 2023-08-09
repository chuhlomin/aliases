#!/bin/bash
#
# clone is a wrapper on top of the `git clone` command, it:
# 1. parses the URL
# 2. creates "owner" directory in ~/Projects/
# 3. clones repository into ~/Projects/<owner>/<repo>
#
# Usage:
# clone git@github.com:chuhlomin/terraform.git
# clone https://github.com/chuhlomin/terraform.git
#
# Install:
# chmod +x clone.sh
# mv clone.sh /usr/local/bin/clone
#
# License: GPL v3.0 https://opensource.org/licenses/GPL-3.0
# Author: Konstantin Chukhlomin
# Version: 1.0

PROJECTS_DIR=~/Projects

IFS=':/' read -ra ADDR <<< "$1"

if [ ${#ADDR[@]} == 3 ] # for URLs like git@github.com:chuhlomin/homepage.git
then
    OWNER=${ADDR[1]}
    REPO=${ADDR[2]%".git"}
elif [ ${#ADDR[@]} == 6 ] # for URLs like # https://github.com/chuhlomin/homepage.git
then
    OWNER=${ADDR[4]}
    REPO=${ADDR[5]%".git"}
else
    echo "Unrecognized repository URL"
    exit 1
fi

mkdir -p $PROJECTS_DIR/$OWNER

git clone $1 $PROJECTS_DIR/$OWNER/$REPO
