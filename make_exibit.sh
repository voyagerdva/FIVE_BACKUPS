#!/bin/bash

index=$(( 0 ))

for i in {1..6}; do
    mkdir dir$i 2>/dev/null
done

for file in $(pwd)/*
do
    ((index++))
    if [ -d "$file" ]; then
        for i in {1..8}; do
            touch $pwd/$file/test_$i.tar.gz
        done;
    fi

    if [[ $(($index % 2)) -eq 0 ]] && [[ -d "$file" ]]; then
        cd  $file
        mkdir subdir_$index 2>/dev/null
        cd ..
    fi

done
