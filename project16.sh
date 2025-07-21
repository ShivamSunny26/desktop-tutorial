#!/bin/bash

echo "Enter the path of the first file:"
read file1

echo "Enter the path of the second file:"
read file2

# Check if both files exist
if [ ! -f "$file1" ]; then
    echo "Error: File '$file1' not found."
    exit 1
fi

if [ ! -f "$file2" ]; then
    echo "Error: File '$file2' not found."
    exit 1
fi

# Check if the files are equal
if cmp -s "$file1" "$file2"; then
    echo "The files '$file1' and '$file2' are equal."
    echo "Do you want to delete one of them? (y/n)"
    read choice
    case $choice in
        [Yy]* )
            echo "Which file do you want to delete? (1 for '$file1', 2 for '$file2')"
            read delete_choice
            case $delete_choice in
                1 )
                    rm "$file1"
                    echo "File '$file1' deleted."
                    ;;
                2 )
                    rm "$file2"
                    echo "File '$file2' deleted."
                    ;;
                * )
                    echo "Invalid choice. No files deleted."
                    ;;
            esac
            ;;
        [Nn]* )
            echo "No files deleted."
            ;;
        * )
            echo "Invalid choice. No files deleted."
            ;;
    esac
else
    echo "The files '$file1' and '$file2' are not equal."
fi
