#!/bin/bash
# This was written with Ubuntu in mind. Change the path in the 
# WORDS variable below if your distro stores its dictionary in 
# a different location.
#
# Use periods to represent unknown characters.
# For example: b.con   or   a..le


WORDS=/usr/share/dict/words
LEN=0
while [ $LEN != 5 ]
do
echo 'Pattern must be 5 characters.'
read -p 'Use periods to represent unknown characters.  ' PATTERN
LEN=`echo $PATTERN | wc -c`
LEN=`expr $LEN - 1`
done
read -p 'Enter letters to be excluded - no spaces. ' OMIT
OMIT=`echo $OMIT | awk '$1=$1' FS= OFS=" -e "`
echo '-----------------------------------------------'
echo 'The following words match the pattern provided.'
echo '-----------------------------------------------'
cat $WORDS | grep -w $PATTERN | grep -v ".....'s" | grep -v "....'s" | grep -v "...'s" | grep -v -e $OMIT
