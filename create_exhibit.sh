#!/bin/bash

makeDirs() {
    index=$(( 0 ))

    for i in {1..4}; do
        mkdir dir$i 2>/dev/null
    done

    for dir in $(pwd)/*
    do
        ((index++))
        if [[ $(($index % 2)) -eq 0 ]] && [[ -d "$dir" ]]; then
            cd  $dir
            mkdir subdir_$index 2>/dev/null
            cd ..
        fi
    done
}


makeFiles() {
    for dir in $(pwd)/*
    do
        index=$(( 0 ))
        ((index++))
        if [ -d "$dir" ]; then
            for i in {1..8}; do
                touch $pwd/$dir/test_$i.tar.gz
                sleep 0.1
            done;
        fi
    done
}
##############################################################

rm -r dir* 2>/dev/null
makeDirs
makeFiles
