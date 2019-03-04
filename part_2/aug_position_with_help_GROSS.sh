#!/bin/bash

#prints three arguments in reverse order
usage="Usage: $(basename "$0"): Command [-h] [arg1] [arg2] [arg3] -- program that prints three arguments in reverse order. Option [-h] prints this usage text."

if [ ${#} -lt 3 ] ; then
    printf "\n$usage\n\n"
    exit 1;
fi

while getopts ":h" optname
  do
    case "$optname" in
      "h")
        printf "\n$usage\n\n"
        exit 0;
        ;;
        *)
        printf "\nError: Unknown option: -$OPTARG\n"
        exit 0;
        ;;
    esac
done

shift $(($OPTIND - 1))

printf "$3 $2 $1\n"
