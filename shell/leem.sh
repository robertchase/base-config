#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ERGALEIA=${ERGALEIA:-$HOME/git/ergaleia}

export PYTHONPATH=$ERGALEIA:$DIR

MATCH=$(leek $*)
if [ -z "$MATCH" ]; then
    echo 'no match'
    return
fi
echo "$MATCH" | python -m listall
