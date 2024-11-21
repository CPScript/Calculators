package main

import (
	"fmt"
)

func calculate(op string, num1, num2 float64) (float64, error) {
	switch op {
	case "+":
		return num1 + num2, nil
	case "-":
		return num1 - num2, nil
	case "*":
		return num1 * num2, nil
	case "/":
		if num2 != 0 {
			return num1 / num2, nil
		}
		return 0, fmt.Errorf("error: division by zero")
	default:
		return 0, fmt.Errorf("error: unsupported operation")
	}
}

func main() {
	var num1, num2 float64
	var operation string

	fmt.Println("Simple Calculator")

	fmt.Print("Enter first number: ")
	_, err := fmt.Scan(&num1)
	if err != nil {
		fmt.Println("Invalid input for the first number.")
		return
	}

	fmt.Print("Enter operation (+, -, *, /): ")
	_, err = fmt.Scan(&operation)
	if err != nil {
		fmt.Println("Invalid input for operation.")
		return
	}

	fmt.Print("Enter second number: ")
	_, err = fmt.Scan(&num2)
	if err != nil {
		fmt.Println("Invalid input for the second number.")
		return
	}

	result, err := calculate(operation, num1, num2)
	if err != nil {
		fmt.Println(err)
	} else {
		fmt.Printf("Result: %.2f\n", result)
	}
}
