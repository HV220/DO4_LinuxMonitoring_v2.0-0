#!/bin/bash

source ./validator.sh
source ./generator_files.sh


export amount_parametres=${#}
export path_of_file=${1}
export amount_dirs=${2}
export letters=${3}
export amount_files=${4}
export letters_name_files=${5}
export size_of_files=${6}

function main()
{
    GeneralValidation
    GeneralGenerator
}

main