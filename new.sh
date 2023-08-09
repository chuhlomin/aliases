#!/bin/bash
# new <template> <new go module> is an alias for gonew:
# gonew github.com/chuhlomin/gonew/<template> github.com/<current_directory>/<new go module>
#
# Usage example:
#
# $ cd ~/Projects/username
# $ new server project
# gonew: initialized github.com/username/project in ./project

function usage {
  echo "Usage: new <template> <new go module>"
  echo "Example: new server project"
  exit 1
}

# check arguments
if [ $# -ne 2 ]; then
  usage
fi

# get current directory
current_directory=$(pwd)

# if current directory is not in ~/Projects then exit
if [[ ! $current_directory =~ ^/Users/[^/]+/Projects/ ]]; then
  echo "current directory is not in ~/Projects"
  exit 1
fi

# get current directory name
name=${PWD##*/}
name=${name:-/}

# run gonew
gonew github.com/chuhlomin/gonew/$1 github.com/$name/$2
