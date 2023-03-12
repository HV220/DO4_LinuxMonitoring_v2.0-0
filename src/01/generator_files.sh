#!/bin/bash

function CreationLog() {

touch log.txt

if ! [[ -f "log.txt" ]]; then
    FatalError 1
fi

}

CreationDirectory() {
    for (( number=0; number <$amount_dirs; number++ ))
    do
        name_dir=""
        CreationDirectoryLogic
        CreateFile
    done
}

function CreationDirectoryLogic {

    while [ ${#rand} -le ${#letters} ]
    do
    rand+=${letters:$(( RANDOM % ${#letters} )):1}
    rand+=${letters:$(( RANDOM % ${#letters} )):1}
    done
    
    name_dir+=$rand
    name_dir+="_"
    name_dir+=$(date +"%d%m%y")

    mkdir $name_dir

    echo $path_of_file"/"$name_dir - $(date +'%e.%m.%Y')  >> log.txt
}

function CreateFile {
    name_file_begin="$(echo $letters_name_files | awk -F "." '{print $1}')"
    name_file_end="$(echo $letters_name_files | awk -F "." '{print $2}')"

    for (( number_files=0; number_files <$amount_files; number_files++ ))
    do
        name_file=""

        CreateFileLogic

        echo $path_of_file"/"$name_dir"/"$name_file - $(date +'%e.%m.%Y') - $size_of_files "Kb" >> log.txt
    done
}

function CreateFileLogic() {
    rand=""

    while [ ${#rand} -le ${#name_file_begin} ]
    do
    rand+=${name_file_begin:$(( RANDOM % ${#name_file_begin} )):1}
    rand+=${name_file_begin:$(( RANDOM % ${#name_file_begin} )):1}
    done

    name_file+=$rand
    name_file+="_"
    name_file+=$(date +"%d%m%y")
    name_file+="."
    name_file+=$name_file_end

    fallocate -l $size_of_files"KB" ./$name_dir/$name_file

    if [[ $(df / -BM | grep "/" | awk -F"M" '{ print $3 }') -le 1024 ]]
    then
        exit 1
    fi
}

function GeneralGenerator() {
    CreationLog
    CreationDirectory
}

function FatalError() {
    if [[ $1 -eq 1 ]]; then
    echo "FatalError: log.txt was not created";
    exit 1;
    fi
}