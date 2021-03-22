#!/bin/bash

for file in $(pwd)/*
do
    if [ -d "$file" ]; then
        cd $file
        find . -maxdepth 1 -type f -name '*.tar.gz' | xargs ls -tr | head -n -5 | xargs rm -r
        cd ..
    fi
done
