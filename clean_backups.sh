#!/bin/bash

for file in $(pwd)/*
do
    if [ -d "$file" ]; then
        cd $file
        echo "====================== $file ==========================="
        ls -lrta --full-time
        echo "----------"
        find . -maxdepth 1 -type f -name '*.tar.gz' | xargs ls -tr | head -n -3 | xargs rm -r
        cd ..
    fi
done
