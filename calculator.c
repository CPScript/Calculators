#include <stdio.h>
#include <stdlib.h>

double calculate(double num1, double num2, char operation) {
    switch (operation) {
        case '+':
            return num1 + num2;
        case '-':
            return num1 - num2;
        case '*':
            return num1 * num2;
        case '/':
            if (num2 != 0) {
                return num1 / num2;
            } else {
                printf("Error: Division by zero\n");
                exit(EXIT_FAILURE);
            }
        default:
            printf("Error: Unsupported operation\n");
            exit(EXIT_FAILURE);
    }
}

int main() {
    printf("Simple Calculator\n");

    while (1) {
        double num1, num2;
        char operation;

        printf("Enter first number: ");
        scanf("%lf", &num1);

        printf("Enter operation (+, -, *, /): ");
        scanf(" %c", &operation);

        printf("Enter second number: ");
        scanf("%lf", &num2);

        double result = calculate(num1, num2, operation);
        printf("Result: %.2f\n", result);

        char continueCalc;
        printf("Do you want to perform another calculation? (y/n): ");
        scanf(" %c", &continueCalc);
        if (continueCalc != 'y' && continueCalc != 'Y') {
            break;
        }
    }

    printf("Goodbye!\n");
    return 0;
}
