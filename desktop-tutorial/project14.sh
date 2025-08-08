#!/bin/bash

# Get the sorted output of the who command and count the number of users
sorted_output=$(who | sort)
user_count=$(echo "$sorted_output" | wc -l)

# Display the sorted output and the total number of users
echo "Sorted output of 'who' command:"
echo "$sorted_output"
echo "Total number of users: $user_count"
