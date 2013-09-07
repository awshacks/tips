#!/bin/sh

BASE_DIR=`pwd`
SRC_DIR="${BASE_DIR}/source"
BUILD_DIR="${BASE_DIR}/build"

cp -a EC2 $SRC_DIR
cd $SRC_DIR

find $SRC_DIR -name "*.md" | sed -e 's/\.md$//' | xargs -I 'mdfile' pandoc -r markdown -w rst -o 'mdfile'.rst 'mdfile'.md

cd $SRC_DIR
find . -name "*.rst" > md2rst_list.txt
