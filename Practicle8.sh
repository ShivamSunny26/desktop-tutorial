calculate_sum_of_digits() {
    local number=$1
    local sum=0

    # Loop through each digit of the number
    while [ $number -gt 0 ]; do
        digit=$((number % 10)) #Extract the last digit
        sum=$((sum + digit)) #Add the digit to the sum
        number=$((number / 10)) # Remove the last digit
    done

    echo $sum
}

# Main program
echo "Enter a number: "
read input_number

# Call the function to calculate the sum of digits
sum_of_digits=$(calculate_sum_of_digits $input_number)
echo "Sum of digits of $input_number is: $sum_of_digits"
