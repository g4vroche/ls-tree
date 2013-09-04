#!/bin/sh

for last; do true; done

if [ "$last" != "" ]; then

    IS_OPTION=$(echo $last |grep "^-")
    
    if [ -z $IS_OPTION ]; then  #if parameter exists, use as base folder
        cd "$last"
    fi
fi

MAXDEPTH=0
INDENT=" "
DEPTH=0
STYLE=""
bold=`tput bold`
normal=`tput sgr0`

usage()
{
cat << EOF
usage: $0 options

This script shows a directory tree structure

OPTIONS:
   -h       Show this message
   [-d]     depth: Maximum depth (default infinite)
   [-s]     style: Set the sequence used to indent results
EOF
}

while getopts “d:s:” OPTION
do
     case $OPTION in
         h)
            usage
            exit
            ;;
         d)
            MAXDEPTH=$OPTARG
             ;;
         s)
            INDENT=$OPTARG
            ;;
     esac
done

TEST=$(echo $MAXDEPTH |grep -o '[^0-9]*')


if [ ! -z $TEST ]
then
    echo "Depth -d must be an integer"
    exit 2;
fi

echo $bold`pwd`$normal

for FILE in `ls -R --file-type *`; do

    ISDIR=`echo $FILE | grep "[:/]$"`
    
    if [ $ISDIR ]; then
        # Rely on slashes to count depth
        DEPTH=$(echo -n $FILE|sed 's/[^\/]//g' |wc -m)
    fi

    if [ $MAXDEPTH -eq 0 ] || [ $DEPTH -lt $MAXDEPTH ]; then

        if [ -z $ISDIR  ]; then
            # Display file
            echo "$STYLE$INDENT $FILE"

        else
            # Check if we want to display the directory now 
            # and remove slash and semi column from filename
            FILENAME=$(echo -n $FILE|grep -o '[^\/]*:$'|sed -e 's/[\/:]//g')

            if [ $FILENAME ]; then
                # Add awesome indentation
                STYLE=$(printf "%$DEPTH""s" ""|sed "s/ /$INDENT/g")
                echo "$STYLE $bold$FILENAME$normal"
            fi
        fi
    fi
done


# KTHXBYE
exit
