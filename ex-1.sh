read -p "Enter a number: " num

# Compare the number with 10
if [ "$num" -gt 10 ]; then
    echo "The number is greater than 10."
elif [ "$num" -lt 10 ]; then
    echo "The number is less than 10."
else
    echo "The number is equal to 10."
fi