#!/bin/sh
usage="Usage: on_jars.sh \$jar_folder \$keyword"

if [ $# -le 1 ]; then
	    echo $usage
		    exit 1
		fi

jar_folder=$1
keyword=$2
TMP=/tmp/on_jar

cd $jar_folder

if [ ! -d "$TMP" ];then
    mkdir $TMP
fi

for file in $(ls *.jar)
do
	cp $file $TMP
	cd $TMP
	jar -xvf $file | grep -i $2
    if [ $? -eq 0 ] ;then
		echo "Find keyword[$2] in "$file
	fi
	rm $TMP/* -rf
	cd $jar_folder
done
