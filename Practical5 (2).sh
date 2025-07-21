echo "Enter a number:"
read num
for ((i=0;i<=10;i++))
do
    echo "$num x $i = $((num * i))"
done
 