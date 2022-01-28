#!/bin/bash
# This was written to work with Ubuntu. Change the path in the
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
echo '-----------------------------------------------'
echo 'The following words match the pattern provided.'
echo '-----------------------------------------------'
cat $WORDS | grep -w $PATTERN | grep -v ".....'s"
