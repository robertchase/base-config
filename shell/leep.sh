#!/usr/bin/env bash
KEY=${KEY:-pass}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ERGALEIA=${ERGALEIA:-$HOME/git/ergaleia}
export PYTHONPATH=$ERGALEIA:$DIR

MATCH=$(leek $*)
if [ -z "$MATCH" ]; then
    echo 'no match'
    return
fi

COUNT=$(echo "$MATCH" | wc -l)
if [ $COUNT -gt 1 ]; then
    echo "$MATCH" | python -m listtok | awk '{printf "[%s] %s\n", NR, $0}'
    read -r line

    if [ -z "$line" ]; then
        echo 'no choice'
        return
    elif [ $line -gt $COUNT ]; then
        echo 'no line matched'
        return
    fi

    MATCH=$(echo "$MATCH" | head -$line | tail -1)
fi

args=$(echo "$MATCH" | python -m listtok)
value=$(echo "$MATCH" | python -m listtok -k $KEY | tr -d '\n')
if [ -z "$value" ]; then
    echo "no '$KEY' found for '$args'"
    return
fi

echo -n "$value" | pbcopy
echo "copied '$KEY' to clipboard for '$args'"