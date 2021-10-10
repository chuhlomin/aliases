#!/bin/bash

# Original work: https://gist.github.com/mihow/9c7f559807069a03e302605691f85572

function e {
    local filename=$([ -z "$1" ] && echo ".env" || echo "$1");

    if [ -f $filename ]
    then
        set -o allexport;
        source $filename;
        set +o allexport;
    else
        echo "File $filename not found";
    fi
}
