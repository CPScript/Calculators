<?php

function calculate($op, $num1, $num2) {
    switch ($op) {
        case '+':
            return $num1 + $num2;
        case '-':
            return $num1 - $num2;
        case '*':
            return $num1 * $num2;
        case '/':
            if ($num2 != 0) {
                return $num1 / $num2;
            } else {
                return 'Error: Division by zero';
            }
        default:
            return 'Error: Unsupported operation';
    }
}

function main() {
    echo "Simple Calculator\n";

    echo "Enter first number: ";
    $num1 = trim(fgets(STDIN));

    echo "Enter operation (+, -, *, /): ";
    $operation = trim(fgets(STDIN));

    echo "Enter second number: ";
    $num2 = trim(fgets(STDIN));

    // Convert inputs to float
    $num1 = (float)$num1;
    $num2 = (float)$num2;

    $result = calculate($operation, $num1, $num2);
    echo "Result: $result\n";
}

main();
