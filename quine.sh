if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: ./quine.sh [flags] FILE"
    echo "flags:"
    echo "  -c:  C Colleen"
    echo "  -g:  C Grace"
    echo "  -s:  C Sully"
    echo "  -ca: ASM Colleen"
    echo "  -ga: ASM Grace"
    echo "  -sa: ASM Colleen"

    exit 1
elif [ $# -eq 1 ]; then
    file=$1
    mode="-c"
else
    mode=$1
    file=$2
fi

if [ ! -f $file ]; then
    echo "File do not exist"
    exit 1
fi

# C
if [ "$mode" = "-c" ]; then # Colleen in C
    string="\"$(cat $file | sed -e 's/%/%%/g' | sed -r 's/char \*str = ".*"/char *str = %2$c%3$s%2$c/' | sed -e 's/"/%2$c/g' | sed -e 's/$/%1$c/' | tr -d '\n')\""
    sed -i "s|char \*str = \".*\"|char *str = $string|" $file
elif [ "$mode" = "-g" ]; then # Grace in C
    string="\"$(cat $file | sed -e 's/%/%%/g' | sed -r 's/#define STR ".*"/#define STR %2$c%3$s%2$c/' | sed -e 's/"/%2$c/g' | sed -e 's/$/%1$c/' | tr -d '\n')\""
    sed -i "s|#define STR \".*\"|#define STR $string|" $file
elif [ "$mode" = "-s" ]; then # Sully in C
    string="\"$(cat $file | sed -e 's/%/%%/g' | sed -r 's/char \*str = ".*"/char *str = %2$c%3$s%2$c/' | sed -r 's/int i = .*;/int i = %4$i;/' | sed -e 's/"/%2$c/g' | sed -e 's/$/%1$c/' | tr -d '\n')\""
    sed -i "s|char \*str = \".*\"|char *str = $string|" $file
# ASM
elif [ "$mode" = "-ca" ]; then # Colleen in ASM
    string="\"$(cat $file | sed -e 's/%/%%/g' | sed -r 's/str: db ".*"/str: db %2$c%3$s%2$c/' | sed -e 's/"/%2$c/g' | sed -e 's/$/%1$c/' | tr -d '\n')\""
    sed -i "s|str: db \".*\"|str: db $string|" $file
elif [ "$mode" = "-ga" ]; then # Grace in ASM
    string="\"$(cat $file | sed -e 's/%/%%/g' | sed -r 's/\%define STR ".*"/%define STR %2$c%3$s%2$c/' | sed -e 's/"/%2$c/g' | sed -e 's/$/%1$c/' | tr -d '\n')\""
    sed -i "s|\%define STR \".*\"|%define STR $string|" $file
elif [ "$mode" = "-sa" ]; then # Sully in ASM
    string="\"$(cat $file | sed -e 's/%/%%/g' | sed -r 's/str: db ".*"/str: db %2$c%3$s%2$c/' | sed -e 's/\%define i .*$/%define i %4$i/' | sed -e 's/"/%2$c/g' | sed -e 's/$/%1$c/' | tr -d '\n')\""
    sed -i "s|str: db \".*\"|str: db $string|" $file
else
    echo "quine: invalid option $mode"
    exit 1
fi
echo Done!
