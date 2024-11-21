#!/bin/bash

while true
do
    read -p "Enter first number: " num1
    read -p "Enter operation (+, -, *, /): " operation
    read -p "Enter second number: " num2

    case $operation in
        "+")
            result=$(echo "$num1 + $num2" | bc)
            ;;
        "-")
            result=$(echo "$num1 - $num2" | bc)
            ;;
        "*")
            result=$(echo "$num1 * $num2" | bc)
            ;;
        "/")
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero"
                continue
            fi
            result=$(echo "$num1 / $num2" | bc)
            ;;
        *)
            echo "Error: Unsupported operation"
            continue
            ;;
    esac

    echo "Result: $result"

    read -p "Do you want to perform another calculation? (y/n): " continueCalc
    if [ "$continueCalc" != "y" ]; then
        break
    fi
done

echo "Goodbye!"
