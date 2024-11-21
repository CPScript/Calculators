def calculate(num1, num2, operation):
    if operation == '+':
        return num1 + num2
    elif operation == '-':
        return num1 - num2
    elif operation == '*':
        return num1 * num2
    elif operation == '/':
        if num2 != 0:
            return num1 / num2
        else:
            raise ValueError("Error: Division by zero")
    else:
        raise ValueError("Error: Unsupported operation")

def main():
    print("Simple Calculator")

    while True:
        try:
            num1 = float(input("Enter first number: "))
            operation = input("Enter operation (+, -, *, /): ")
            num2 = float(input("Enter second number: "))

            result = calculate(num1, num2, operation)
            print(f"Result: {result}")

            continue_calc = input("Do you want to perform another calculation? (yes/no): ")
            if continue_calc.lower() != 'yes':
                break
        except ValueError as e:
            print(e)
        except Exception as e:
            print("An unexpected error occurred:", e)

    print("Goodbye!")

if __name__ == "__main__":
    main()
