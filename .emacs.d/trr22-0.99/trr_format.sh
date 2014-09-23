#!/bin/sh
SOURCE=$1

grep -v '^[ \t]*$' $SOURCE | sed 's/\([.?!;]\) *$/\1/g' | sed 's/^[ 	][ 	]*\([^ 	].*\)$/\1/g' > ${SOURCE}.formed
