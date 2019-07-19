#!/bin/bash

expression="$1"
file="$2"

git-list-commits.sh "$file" | while read next; do
    if [ -n "$c" ] && [ -n "$(git diff "$c~" "$c" -- "$file" | grep "${expression}")" ]; then
        echo -n "${c} "
        echo -n "$(git show -s --format=%ci "$c" | sed 's/ .*//') "
        printf -v user %-30.30s "$(git show -s --format=%an "$c")"
        echo -n "$user"
        echo -n "$(git show -s --format=%B "$c" | head -n 1)"
        echo
    fi

    c=$next
done
