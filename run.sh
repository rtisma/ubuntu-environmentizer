#!/bin/bash

args=("$@")

first_arg=${args[0]}

#get the sublist of the args excluding the first
other_args=("${args[@]:1}") 

host_dir=`readlink -f $first_arg`
echo "##################################"
echo " Configuration"
echo "##################################"
echo "User defined workspace on docker host: $host_dir"
echo "Command: ${other_args[@]}"


echo ""
echo "##################################"
echo " Running ubuntu-environmentizer..."
echo "##################################"

docker run \
    --rm \
    -it  \
    --name "ubuntu-env-1" \
    -v "$host_dir:/user-dir" \
    ubuntu-environmentizer:latest \
    "${other_args[@]}"
