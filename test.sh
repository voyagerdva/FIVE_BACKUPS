#!/bin/bash

makeDirs() {
    for i in {1..6}; do
        mkdir dir$i 2>/dev/null
    done
}


makeFiles() {
    for file in $(pwd)/*
    do
        index=$(( 0 ))
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
}

runClean() {
    ./clean_backups.sh
}

checkResult() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    echo "$DIR"
    echo "ll $DIR"
    for file in $(pwd)/*
    do
        if [ -d "$file" ]; then
            cd $file
            find . -maxdepth 1 -type f -name '*.tar.gz' | sort > list.txt
#            ls -rt > list.txt
#            if [ $(cat list.txt) = $(cat list_etalon.txt) ]; then
            if diff list.txt $DIR/list_etalon.txt; then
                echo "YES !!!"
            fi
            cd ..
        fi
    done
}

##############################################################################
makeDirs
makeFiles
runClean
checkResult
