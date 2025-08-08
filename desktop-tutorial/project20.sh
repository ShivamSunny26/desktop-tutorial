#!/bin/bash

# Check if all arguments are provided
if [ $# -ne 4 ]; then
    echo "Usage: $0 <start_month> <start_year> <end_month> <end_year>"
    exit 1
fi

start_month=$1
start_year=$2
end_month=$3
end_year=$4

# Check if the input months are valid
if ! [[ "$start_month" =~ ^[1-9]|1[0-2]$ ]]; then
    echo "Invalid start month. Please enter a valid month (1-12)."
    exit 1
fi

if ! [[ "$end_month" =~ ^[1-9]|1[0-2]$ ]]; then
    echo "Invalid end month. Please enter a valid month (1-12)."
    exit 1
fi

# Iterate through the range of months and display the calendar for each month
current_month=$start_month
current_year=$start_year

while [[ "$current_year$current_month" -le "$end_year$end_month" ]]; do
    echo "Calendar for $current_month/$current_year:"
    cal $current_month $current_year
    echo ""
    
    # Increment month and year
    if [ "$current_month" -eq 12 ]; then
        current_month=1
        ((current_year++))
    else
        ((current_month++))
    fi
done
