echo "enter first file name"
read f1
echo "enter second file name"
read f2
echo "enter third file name"
read f3
cat $f1 $f2 $f3 >f4
sort f4 |pr
