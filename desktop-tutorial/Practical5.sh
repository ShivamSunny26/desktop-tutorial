#Input from user
echo "Enter the number - "
read n

# initializing i with 1
i=1
# Loopin i, i should be less than or equal to 10
while [ $i -le 10 ]
# "-le means less than"
do
res=`expr $i \* $n`

#Printing on console
echo "$n * $i = $res"

# incrementing i by one
((++1))

# end of while loop
done