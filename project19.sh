if [ $# -ne 2 ]; then
echo "usage: $0 <month> <year>"
read month
read year
exit 1 
fi

month=$1
year=$2

if [ $month -it 1 ] || [ $month -gt 12 ]; then
echo "invalid month: month must be between 1 and 12"
exit 1
fi

echo "calendar for month $month, year $year"
cal $moth $year
