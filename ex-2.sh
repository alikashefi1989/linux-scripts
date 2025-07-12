#!/bin/bash

# Initialize variables
count=0
min=""
max=""

echo "Enter 20 numbers:"

while [ $count -lt 20 ]; do
    read -p "Number $((count + 1)): " num

    # Check if input is a valid number (integer or float)
    if ! [[ $num =~ ^-?[0-9]+([.][0-9]+)?$ ]]; then
        echo "Invalid input. Please enter a valid number."
        continue
    fi

    # Initialize min and max with the first input
    if [ $count -eq 0 ]; then
        min=$num
        max=$num
    else
        # Use bc for floating point comparison
        if (( $(echo "$num < $min" | bc -l) )); then
            min=$num
        fi
        if (( $(echo "$num > $max" | bc -l) )); then
            max=$num
        fi
    fi

    ((count++))
done

echo ""
echo "Smallest number: $min"
echo "Largest number:  $max"