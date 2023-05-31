#!/bin/bash
#Bingo Number Generator
echo -e "\n~~ Bingo Number Generator ~~\n"

TEXT="The next number is, "
NUMBER=$(( RANDOM%75 + 1))

if (( NUMBER <= 15 ))
# with round parentheses, we need to use <, <=, etc.
    then echo $TEXT B:$NUMBER
elif [[ $NUMBER -le 30 ]]
    then echo $TEXT I:$NUMBER
elif (( NUMBER < 46 ))
    then echo $TEXT N:$NUMBER
elif [[ $NUMBER -lt 61 ]]
    then echo $TEXT G:$NUMBER
else
    echo $TEXT O:$NUMBER
fi