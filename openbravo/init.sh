#!/bin/bash

set -e

PATH_ENV=$PWD

env_modules=()
for i in `ls $PATH_ENV/modules`; do
    env_modules=(${env_modules[@]} $i)
done

complete_modules=()
for i in `ls $PATH_ENV/complete_modules`; do
    complete_modules=(${complete_modules[@]} $i)
done

for i in ${env_modules[@]}; do
    for j in ${complete_modules[@]}; do
        if [ "$i" == "$j" ]; then
            rm -rf $PATH_ENV/modules/$j
        fi
    done
done

if [ "$(ls -A $PATH_ENV/complete_modules)" ]; then
    cp -R $PATH_ENV/complete_modules/* $PATH_ENV/modules/
fi

if [ "$(ls -A $PATH_ENV/partial_modules)" ]; then
    cp -R $PATH_ENV/partial_modules/* $PATH_ENV/modules/
fi
