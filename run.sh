name=wxg

for test in $(ls ./testcase) 
do
    echo "$test begin"
    java -jar qs.jar <./testcase/$test >qs.txt
    java -jar $name.jar <./testcase/$test >$name.txt
    diff -y -W  200 qs.txt $name.txt > diff.txt

    if [ $? -ne 0 ] ; then
        echo "WA"
        cat diff.txt
        read
    else
        echo "AC"
    fi
done
echo "AK"
read