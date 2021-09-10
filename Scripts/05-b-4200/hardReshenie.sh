#!/bin/bash

level=0
max=0

while read line; do
        if [ $line = '{' ]; then
                level=$(( $level + 1 ))
        fi

        if [ $line = '}' ]; then
                if [ $level -gt $max ]; then
                        max=$level
                fi
                level=$(( $level -1 ))
        fi
done < <( state='code'; cat file.c | sed 's|//|\n//|m' | grep -v '^//' | while read -n 1 char; do
        case $state in
                code)
                        if [ "$char" = '/' ]; then
                                state='begin_comment'
                        elif [ "$char" = '"' ]; then
                                state="literal"
                        else
                                echo -n "$char"
                        fi
                ;;
                literal)
                        if [ "$char" = '"' ]; then
                                state='code'
                        fi
                ;;
                begin_comment)
                        if [ "$char" = '*' ]; then
                                state='multiline_comment'
                        else
                                state='code'
                        fi
                ;;
                multiline_comment)
                        if [ "$char" = '*' ]; then
                                state='close_comment_maybe'
                        fi
                ;;
                close_comment_maybe)
                        if [ "$char" = '/' ]; then
                                state='code'
                        else
								state='multiline_comment'
						fi
				;;
		esac
done | grep -o . | grep '[{}]' )

echo $max
