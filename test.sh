#!/bin/bash

createExhibit() {
    ./create_exhibit.sh
}

runClean() {
    ./clean_backups.sh
}

checkResult() {
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    for file in $(pwd)/*
    do
        if [ -d "$file" ]; then
            cd $file
            find . -maxdepth 1 -type f -name '*.tar.gz' | sort > list.txt
            if diff list.txt $DIR/list_etalon.txt; then
                echo "Очистка директории $file выполнена корректно!"
            fi
            cd ..
        fi
    done
}

##############################################################################
sleep 1
echo "Create exhibit..."
createExhibit
echo "Done!"
tree

sleep 1
echo "Next step is cleaning our directories. All archives will be removed except for last five. Other files and directories will not be affected ..."
runClean
sleep 1

echo "Check result:"
checkResult

tree
