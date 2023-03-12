#!/bin/bash

function ValidationOfEmpty() {

    if [[ $amount_parametres -ne 6 ]]; then
       FatalError 1
       fi 
}

function ValidationOfPath() {

    end_slash=$(echo "${path_of_file}" | tail -c 2)
    
    if ! [[ -d $path_of_file ]] || [[ $end_slash == "/" ]];
    then
        FatalError 2
    fi
}

function ValidationOfPath() {

    end_slash=$(echo "${path_of_file}" | tail -c 2)
    
    if ! [[ -d $path_of_file ]] || [[ $end_slash == "/" ]];
    then
        FatalError 2
    fi
}

function ValidationOfSubFolders() {
    checker='^[1-9][0-9]+?$'

    if ! [[ $amount_dirs  =~ $checker ]]
    then
        FatalError 3
    fi
}

function ValidationOfLetters() {
    checker='^[a-zA-Z]{1,7}$'

    if ! [[ $letters =~ $checker ]]
    then
        FatalError 4
    fi
}

function ValidationOfAmountFiles() {
    checker='^[1-9][0-9]+?$'

    if ! [[ $count_files =~ $checker ]]
    then
         FatalError 5
    fi
}

function ValidationOfLettersFiles() {
    checker='^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$'

    if ! [[ $letters_name_files =~ $checker ]]
    then
        FatalError 6
    fi
}

function ValidationOfSizeFiles() {
    checker='^[1-9][0-9]?[0]?kb$'

    if ! [[ $size_of_files =~ $checker ]]
    then
        FatalError 7
    fi

    size_of_files=$(echo $size_of_files | awk -F"kb" '{print $1}')
}

function FatalError() {

    if [[ $1 -eq 1 ]]; then
    echo "FatalError: There are some problems with parameters";
    exit 1;
    fi

    if [[ $1 -eq 2 ]]; then
    echo "FatalError: There are some problems with path 1";
    exit 2;
    fi

    if [[ $1 -eq 3 ]]; then
    echo "FatalError: There are some problems with amountSubFolders 2";
    exit 3;
    fi

    if [[ $1 -eq 4 ]]; then
    echo "FatalError: There are some problems with letters for names of folders 3";
    exit 4;
    fi

    if [[ $1 -eq 5 ]]; then
    echo "FatalError: There are some problems with amount of files in folders 4";
    exit 5;
    fi

    if [[ $1 -eq 6 ]]; then
    echo "FatalError: There are some problems with letters for names of files 5";
    exit 6;
    fi

    if [[ $1 -eq 7 ]]; then
    echo "FatalError: There are some problems with size of files 6";
    exit 7;
    fi
}

function GeneralValidation() {
    ValidationOfEmpty
    ValidationOfPath
    ValidationOfSubFolders
    ValidationOfLetters
    ValidationOfLettersFiles
    ValidationOfSizeFiles
}