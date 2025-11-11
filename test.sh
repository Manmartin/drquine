#!/bin/bash
make -C ./C 2>&1 > /dev/null
if [ $? -ne 0 ]; then
    echo C compilation failed
    exit 1
fi
echo "Build: C"

make -C ./ASM 2>&1 > /dev/null
if [ $? -ne 0 ]; then
    echo ASM compilation failed
    exit 1
fi
echo "Build: ASM"

echo
echo "TESTS"
echo "------------"

echo
echo "Colleen:"

./C/Colleen > ./C/tmp_colleen
diff ./C/Colleen.c ./C/tmp_colleen 2>&1 > /dev/null
if [ $? -eq 0 ]; then
    echo "  C   -> OK"
else
    echo "  C   -> KO"
fi
rm -f ./C/tmp_colleen

./ASM/Colleen > ./ASM/tmp_colleen
diff ./ASM/Colleen.s ./ASM/tmp_colleen 2>&1 > /dev/null
if [ $? -eq 0 ]; then
    echo "  ASM -> OK"
else
    echo "  ASM -> KO"
fi
rm -f ./ASM/tmp_colleen

echo
echo "Grace:"

./C/Grace > ./C/tmp_grace
diff ./C/Grace.c ./Grace_kid.c 2>&1 > /dev/null
if [ $? -eq 0 ]; then
    echo "  C   -> OK"
else
    echo "  C   -> KO"
fi
rm -f ./C/tmp_grace ./Grace_kid.c


./ASM/Grace > ./ASM/tmp_grace
diff ./ASM/Grace.s ./Grace_kid.s 2>&1 > /dev/null
if [ $? -eq 0 ]; then
    echo "  ASM -> OK"
else
    echo "  ASM -> KO"
fi
rm -f ./ASM/tmp_grace ./Grace_kid.s

echo
echo "Sully:"

sully_failure_c=false
./C/Sully
diff ./C/Sully.c Sully_5.c
if [ $? -ne 0 ]; then
    sully_failure_c=true
fi

if  $sully_failure_c; then
    echo "  C   -> KO"
else
    echo "  C   -> OK"
fi

rm -f ./Sully_*
make -C ./C fclean 2>&1 > /dev/null
make -C ./ASM fclean 2>&1 > /dev/null
