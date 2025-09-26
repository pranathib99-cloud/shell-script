#!/bin/bash
# Variable in shell scripting
PERSON1=sai    # VAR-NAME=VALUE

echo "all variables passed to the script are : $@"
echo "all variable passed to the script is : $*"

# self special variable

echo "script name is : $0"
echo "cureent dircetory is : $PWD"
echo "home directory is : $HOME"
echo "user name is : $USER"